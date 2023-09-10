import 'package:image_convert/app/modules/authentication/domain/repositories/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  @observable
  bool singInSucess = false;
  @observable
  IauthRepository? repository;
  @action
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    final result = await repository!
        .signInWithEmailAndpasswordRepository(email: email, password: password);
    result.fold((l) => singInSucess = false, (r) => singInSucess = false);
  }
}
