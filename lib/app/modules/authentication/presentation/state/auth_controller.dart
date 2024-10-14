import 'package:image_convert/app/modules/authentication/domain/repositories/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  final IauthRepository repository;
  @observable
  bool? signInSucess;
  @observable
  bool? createAccountSucess;
  @observable
  bool? isLoading;
  String? creatUser;
  String? failureCreateUser;
  AuthControllerBase(
    this.repository,
  );

  @action


  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final result = await repository.signInWithEmailAndpasswordRepository(
        email: email, password: password);

    result.fold((l) => signInSucess = false, (r) => signInSucess = true);
  }

  Future<void> createAccount(
      {required String email, required String password}) async {
    isLoading = true;
    final result = await repository.createUserWithEmailAndPasswordRepository(
        email: email, password: password);
    result.fold((l) {
      createAccountSucess = false;
      failureCreateUser = l;
    }, (r) {
      creatUser = r;
      createAccountSucess = true;
    });
    isLoading = false;
  }

  void listenStateSignIn(
      {required Function onSuccess, required Function onFailure}) {
    autorun((p0) {
      if (signInSucess != null) {
        if (signInSucess!) {
          onSuccess();
        } else {
          onFailure();
        }
      }
    });
  }
}
