import 'package:fpdart/fpdart.dart';

import '../../../../core/models/failure/failure.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> login({
    required String email,
    required String password,
    required bool rememberMe,
  });

  Future<Either<Failure, String>> register({
    required String email,
    required String password,
  });

  Future<bool> isRememberMe();
}
