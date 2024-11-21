import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/on_boarding/presentation/view/pages/on_boarding_page.dart';

class OnBoardingModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const OnBoardingPage());
    super.routes(r);
  }
}
