import 'package:firebase_database/firebase_database.dart';

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
  @observable
  String? realTimeVaue;
  void toDoItem(String item, int? index) {
    if (resultInitial != null) {
      resultInitial!.add(item);
    } else {
      resultInitial = [item];
    }
    if (resultInProgress != null && index != null) {
      deleteItenInProgress(index);
    }
  }

  void loadInProgress(String itens, int index, bool isRight) {
    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.add(itens);
    } else {
      resultInProgress = [itens];
    }

    if (isRight && resultInitial != null) {
      deleteItenToDO(index);
    }
  }

  void changeToConclued(String itens, int index) {
    if (conclued != null && conclued!.isNotEmpty) {
      conclued!.add(itens);
    } else {
      conclued = [itens];
    }

    if (resultInProgress != null) {
      deleteItenInProgress(index);
    }
  }

  deleteItenToDO(int index) {
    if (resultInitial != null && resultInitial!.isNotEmpty) {
      resultInitial!.removeAt(index);
    }
  }

  deleteItenInProgress(int index) {
    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.removeAt(index);
    }
  }

  deleteconcludes(int index) {
    if (conclued != null && conclued!.isNotEmpty) {
      conclued!.removeAt(index);
    }
  }

  void loadTask() {
    try {
      DatabaseReference _sprintDataBase =
          FirebaseDatabase.instance.ref().child('tasks');
      _sprintDataBase.onValue.listen((event) {
        if (event.snapshot.exists) {
          var data = event.snapshot.value;

          if (data is Map) {
            resultInitial = [];
            data.forEach((key, value) {
              resultInitial?.add(value.toString());
            });
          } else {
            resultInitial = [data.toString()];
          }
        } else {
          print("Nenhum dado encontrado.");
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
