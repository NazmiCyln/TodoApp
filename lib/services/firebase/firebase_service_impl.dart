import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../core/models/failure/failure.dart';
import '../network/network_info.dart';
import 'firebase_service.dart';

@LazySingleton(as: FirebaseService)
final class FirebaseServiceImpl implements FirebaseService {
  final FirebaseAuth firebaseAuth;
  final NetworkInfo networkInfo;

  FirebaseServiceImpl({required this.firebaseAuth, required this.networkInfo});

  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(result.user!);
    } on FirebaseAuthException catch (e) {
      return left(Failure.responseError(e.message ?? e.code));
    } on Exception catch (e) {
      return left(Failure.unknownError(e.toString()));
    } catch (e) {
      return left(Failure.unknownError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> registerWithEmailAndPassword({required String email, required String password}) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      return left(Failure.responseError(e.message ?? e.code));
    } on Exception catch (e) {
      return left(Failure.unknownError(e.toString()));
    } catch (e) {
      return left(Failure.unknownError(e.toString()));
    }
  }
}
