import 'package:shared_preferences/shared_preferences.dart';
abstract class IuserAuthenticationVerificationRepository {
  Future<void>saveUser();
  Future<bool>verifyUser();
  Future<void> deleteUser();
}
class UserAuthenticationVerificationRepository  implements IuserAuthenticationVerificationRepository{
  UserAuthenticationVerificationRepository();

  @override
  Future<void> saveUser() async{
    final prefs = await SharedPreferences.getInstance();
await prefs.setBool('register', true);
  }

  @override
  Future<bool> verifyUser() async{
    final prefs = await SharedPreferences.getInstance();
return prefs.getBool('register') == true;
  }
  @override
  Future<void> deleteUser()async{
    final prefs = await SharedPreferences.getInstance();
await prefs.remove('register');
  }
}