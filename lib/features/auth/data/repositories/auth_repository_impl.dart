import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/constants/api_endpoints.dart';
import 'package:todo_app/constants/failure_message.dart';
import 'package:todo_app/features/auth/domain/models/user_model.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/firebase/firebase_service.dart';
import '../../../../services/locale/locale_resources_service.dart';
import '../../../../services/network/network_service.dart';
import '../DTOs/user/user_dto.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final LocaleResourcesService localeResourcesService;
  final NetworkService networkService;
  final FirebaseService firebaseService;

  AuthRepositoryImpl({
    required this.localeResourcesService,
    required this.firebaseService,
    required this.networkService,
  });

  @override
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    await localeResourcesService.setEmail(email);
    await localeResourcesService.setRememberMe(rememberMe);

    final result = await firebaseService.signInWithEmailAndPassword(email: email, password: password);

    return result.fold(
      left,
      (t) async {
        await localeResourcesService.setEmail(email);
        await localeResourcesService.setRememberMe(rememberMe);
        await localeResourcesService.setUserId(t.uid);

        return right(unit);
      },
    );
  }

  @override
  Future<Either<Failure, Unit>> register({
    required String name,
    required String surname,
    required String email,
    required String password,
  }) async {
    final result = await firebaseService.registerWithEmailAndPassword(email: email, password: password);

    return result.fold(
      left,
      (t) async {
        final result = await networkService.post(
          Endpoints.createUser,
          data: {
            "name": name,
            "surname": surname,
            "email": email,
            "user_id": t.uid,
          },
        );

        return result.fold(
          (l) async {
            await firebaseService.deleteAccount();

            return left(l);
          },
          (r) => right(unit),
        );
      },
    );
  }

  @override
  Future<bool> isRememberMe() async {
    return localeResourcesService.getRememberMe();
  }

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    final id = await localeResourcesService.getUserId();

    final result = await networkService.get(
      Endpoints.getUser(id.getOrElse(() => "")),
    );

    return result.fold(
      left,
      (r) => optionOf(r.data).fold(
        () => left(Failure.unknownError(unknownErrorMessage)),
        (t) => t.extract<List>("users").fold(
              () => left(Failure.unknownError(unknownErrorMessage)),
              (t) => right(UserDto.fromJson(t.first as Map<String, dynamic>).toDomain()),
            ),
      ),
    );
  }
}
