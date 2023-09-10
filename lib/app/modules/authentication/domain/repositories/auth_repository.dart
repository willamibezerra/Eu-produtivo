import 'package:dartz/dartz.dart';

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
      return left('Falha ao efetuar a autenticação');
    }
  }
}
