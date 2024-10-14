import 'dart:convert';

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

  Future<void> loadTask() async {
    try {
      DatabaseReference _sprintDataBase =
          FirebaseDatabase.instance.ref().child('to_do');
      final snapshot = await _sprintDataBase.get();
      if (snapshot.exists) {
        Map<Object?, Object?> rawMap = snapshot.value as Map<Object?, Object?>;

        Map<String, dynamic> map = rawMap.map(
          (key, value) => MapEntry(key.toString(), value),
        );
        resultInitial = List<String>.from(map["itens"]);
      }
    } catch (e) {
      print(e);
    }
  }
  //{to_do: {itens: [estudar, trabalhar, codar]}}
}
