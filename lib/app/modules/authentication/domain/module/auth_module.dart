import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/auth_data_source.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';
import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/interfaces/auth_repository_interface.dart';
import 'package:image_convert/app/modules/authentication/presentation/state/auth_controller.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/pages/auth_page.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/pages/register_account_page.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(Auth.new);
    i.add<IauthDataSource>(AuthDataSource.new);
    i.add<IauthRepository>(AuthRepository.new);
    i.add(AuthController.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => LoginPage(controller: Modular.get()),
    );
    r.child(
      '/register',
      child: (context) => RegisterAccountPage(controller: Modular.get()),
    );
    super.routes(r);
  }
}
