import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/interfaces/auth_repository_interface.dart';

class AuthRepository implements IauthRepository {
  final IauthDataSource dataSource;
  AuthRepository({
    required this.dataSource,
  });
  @override
  Future<Either<String, String>> signInWithEmailAndpasswordRepository(
      {required String email, required String password}) async {
    try {
      await dataSource.signInWithEmailAndpassword(
          email: email, password: password);
      return const Right('Autenticação efetuada com sucesso');
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(e.message ?? '');
      }
      return left('Falha ao efetuar a autenticação');
    }
  }

  @override
  Future<Either<String, String>> createUserWithEmailAndPasswordRepository(
      {required String email, required String password}) async {
    try {
      await dataSource.createUserWithEmailAndPassword(
          email: email, password: password);
      return const Right('Autenticação efetuada com sucesso');
    } catch (e) {
      if (e is FirebaseAuthException) {
        return left(e.message ?? '');
      }
      return left('Falha ao efetuar a autenticação');
    }
  }
}
