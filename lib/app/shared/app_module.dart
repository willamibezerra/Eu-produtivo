import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/authentication/domain/module/auth_module.dart';
import 'package:image_convert/app/modules/on_boarding/domain/module/on_boarding_module.dart';
import 'package:image_convert/app/modules/on_boarding/presentation/view/pages/on_boarding_page.dart';
import 'package:image_convert/app/modules/splash/presentation/view/page/splash_screen.dart';
import 'package:image_convert/app/modules/sprint/domain/module/sprint_module.dart';
import 'package:image_convert/app/modules/authentication/presentation/view/pages/authentication_page.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [AuthModule()];
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const SplashScreen());
    r.module('/auth', module: AuthModule());
    super.routes(r);
    r.module('/home', module: HomeModule());
    r.module(
      '/onBoarding',
      module: OnBoardingModule(),
    );
  }
}
