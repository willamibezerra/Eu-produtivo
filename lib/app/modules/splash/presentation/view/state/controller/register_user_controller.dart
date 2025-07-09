import 'package:image_convert/app/modules/splash/domain/repository/user_authentication_verification_repository.dart';
import 'package:mobx/mobx.dart';
part 'register_user_controller.g.dart';
class RegisterUserController = RegisterUserControllerBase with _$RegisterUserController;
abstract class RegisterUserControllerBase with Store {
  @observable
   IuserAuthenticationVerificationRepository repository;
  @observable
   bool? registered;
   @observable
   bool? errorOnLoad = false;
  RegisterUserControllerBase({required this.repository,  this.registered, this.errorOnLoad});
  @action
  Future<void> save()async{
    try {
      await repository.saveUser();

    } catch (e) {
      errorOnLoad = true;
    }
  }
@action
Future<void> verifyUser()async{
  try {
      registered = await repository.verifyUser();

  } catch (e) {
    errorOnLoad =true;
  }
}
@action
Future<void> deleteUser()async{
  try {
    await repository.deleteUser();
    registered = false;
  } catch (e) {
    errorOnLoad = true;
  }
}

}