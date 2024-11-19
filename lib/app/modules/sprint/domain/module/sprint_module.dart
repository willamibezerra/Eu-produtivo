import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_convert/app/modules/sprint/domain/repositories/interfaces/load_todo_itens_repository_interface.dart';
import 'package:image_convert/app/modules/sprint/domain/repositories/load_todo_itens_reposirory.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/pages/sprint_page.dart';
import 'package:image_convert/app/modules/sprint/presentation/view/state/controllers/itens_sprint_controller.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.add(ItensSprintController.new);
    i.add<IloadTodoItensRepository>(LoadTodoItensReposirory.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (context) => SprintPage(
        controller: Modular.get(),
      ),
    );
    super.routes(r);
  }
}
