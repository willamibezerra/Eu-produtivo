import 'package:dartz/dartz.dart';

abstract class IauthRepository {
  Future<Either<String, String>> signInWithEmailAndpasswordRepository(
      {required String email, required String password});
}
