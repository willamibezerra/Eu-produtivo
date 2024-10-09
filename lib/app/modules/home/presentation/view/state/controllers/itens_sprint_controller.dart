import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'itens_sprint_controller.g.dart';

class ItensSprintController = ItensSprintControllerBase
    with _$ItensSprintController;

abstract class ItensSprintControllerBase with Store {
  @observable
  List<Widget>? resultInProgress;
  @observable
  List<Widget>? resultInitial;
  @observable
  List<Widget>? conclued;

  void loadSprint(List<Widget> itens) {
    resultInProgress = itens;
    resultInitial = [];
  }

  void addOneItem(List<Widget> item) {
    resultInitial = item;
  }

  void changeToConclued(List<Widget> itens) {
    conclued = itens;
    resultInProgress = [];
  }
}
