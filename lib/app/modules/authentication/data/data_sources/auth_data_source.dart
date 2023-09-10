import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';

class AuthDataSource implements IauthDataSource {
  final Auth auth;
  AuthDataSource({
    required this.auth,
  });
  @override
  Future<void> signInWithEmailAndpassword(
      {required String email, required String password}) async {
    await auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
