import 'package:mobx/mobx.dart';
part 'itens_sprint_controller.g.dart';

class ItensSprintController = ItensSprintControllerBase
    with _$ItensSprintController;

abstract class ItensSprintControllerBase with Store {
  @observable
  List<String>? resultInProgress;
  @observable
  List<String>? resultInitial;
  @observable
  List<String>? conclued;

  void loadSprint(List<String> itens) {
    resultInProgress = itens;
    resultInitial = [];
  }

  void addOneItem(List<String> item) {
    resultInitial = item;
  }

  void changeToConclued(List<String> itens) {
    conclued = itens;
    resultInProgress = [];
  }
}
