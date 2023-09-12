import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/authentication/domain/module/auth_module.dart';
import 'package:image_convert/app/modules/splash/presentation/view/page/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => const SplashScreen(),
    );
    r.module('/auth', module: AuthModule());
    super.routes(r);
  }
}
