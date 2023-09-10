abstract class IauthDataSource {
  Future<void> signInWithEmailAndpassword(
      {required String email, required String password});
}
