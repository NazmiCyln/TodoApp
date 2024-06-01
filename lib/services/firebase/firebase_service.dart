import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/models/failure/failure.dart';

abstract interface class FirebaseService {
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> registerWithEmailAndPassword({required String email, required String password});

  Future<void> deleteAccount();
}
