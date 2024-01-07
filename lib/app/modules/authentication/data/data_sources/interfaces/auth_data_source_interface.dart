abstract class IauthDataSource {
  Future<void> signInWithEmailAndpassword(
      {required String email, required String password});

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password});
}
