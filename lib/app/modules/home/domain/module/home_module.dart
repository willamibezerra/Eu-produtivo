import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/home/presentation/view/pages/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
    super.routes(r);
  }
}
