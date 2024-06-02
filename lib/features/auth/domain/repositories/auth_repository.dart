import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';
import '../models/user_model.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, Unit>> login({
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<Either<Failure, Unit>> register({
    required String name,
    required String surname,
    required String email,
    required String password,
  });

  Future<bool> isRememberMe();

  Future<Either<Failure, UserModel>> getUser();
}
