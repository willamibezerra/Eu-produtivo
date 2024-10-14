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

  final DatabaseReference _sprintDataBase =
      FirebaseDatabase.instance.ref().child('to_do');

  void toDoItem(String item, int? index) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("to_do");

    if (resultInitial != null) {
      resultInitial!.add(item);
    } else {
      resultInitial = [item];
    }
    if (resultInProgress != null && index != null) {
      deleteItenInProgress(index);
    }
    await ref.update({"itens": resultInitial});
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

  @action
  Future<void> loadTask() async {
    autorun(
      (p0) async {
        try {
          final snapshot = await _sprintDataBase.get();
          if (snapshot.exists) {
            Map<Object?, Object?> rawMap =
                snapshot.value as Map<Object?, Object?>;

            Map<String, dynamic> map = rawMap.map(
              (key, value) => MapEntry(key.toString(), value),
            );
            resultInitial = List<String>.from(map["itens"]);
          }
        } catch (e) {
          print(e);
        }
      },
    );
  }

  Future<void> listenGetItens(
      {required Function onSuccess, required Function onFailure}) async {
    autorun(
      (p0) {
        if (resultInitial != null) {
          onSuccess();
        } else {
          onFailure();
        }
      },
    );
  }
}
  //{to_do: {itens: [estudar, trabalhar, codar]}}
