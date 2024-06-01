import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/features/auth/domain/repositories/auth_repository.dart';

import '../../../../core/models/failure/failure.dart';
import '../../../../services/firebase/firebase_service.dart';
import '../../../../services/locale/locale_resources_service.dart';

@LazySingleton(as: AuthRepository)
final class AuthRepositoryImpl implements AuthRepository {
  final LocaleResourcesService localeResourcesService;
  final FirebaseService firebaseService;

  AuthRepositoryImpl({
    required this.localeResourcesService,
    required this.firebaseService,
  });

  @override
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
    required bool rememberMe,
  }) async {
    await localeResourcesService.setEmail(email);
    await localeResourcesService.setRememberMe(rememberMe);

    return right("Success");
  }

  @override
  Future<Either<Failure, String>> register({required String email, required String password}) async {
    final result = await firebaseService.registerWithEmailAndPassword(email: email, password: password);

    return result.fold(
      left,
      (user) => right("Success"),
    );
  }

  @override
  Future<bool> isRememberMe() async {
    return localeResourcesService.getRememberMe();
  }
}
