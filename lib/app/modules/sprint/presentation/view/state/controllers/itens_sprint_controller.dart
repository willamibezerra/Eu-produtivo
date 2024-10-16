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
  ObservableFuture<void>? loadTaskFuture;

  final DatabaseReference _sprintDataBase =
      FirebaseDatabase.instance.ref().child('to_do');
  @action
  Future<void> toDoItem(String item, int? index) async {
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

  @action
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

  @action
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

  @action
  deleteItenToDO(int index) {
    if (resultInitial != null && resultInitial!.isNotEmpty) {
      resultInitial!.removeAt(index);
    }
  }

  @action
  deleteItenInProgress(int index) {
    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.removeAt(index);
    }
  }

  @action
  deleteconcludes(int index) {
    if (conclued != null && conclued!.isNotEmpty) {
      conclued!.removeAt(index);
    }
  }

  @action
  Future<void> loadTask() async {
    try {
      loadTaskFuture = ObservableFuture(
        _loadTaskFromDatabase(),
      );

      await loadTaskFuture;
    } catch (e) {
      print("Erro ao carregar tarefas: $e");
    }
  }

  Future<void> _loadTaskFromDatabase() async {
    try {
      final snapshot = await _sprintDataBase.get();
      if (snapshot.exists) {
        Map<Object?, Object?> rawMap = snapshot.value as Map<Object?, Object?>;

        Map<String, dynamic> map = rawMap.map(
          (key, value) => MapEntry(key.toString(), value),
        );

        // Atualiza a lista de tarefas inicial
        resultInitial = List<String>.from(map["itens"]);
      }
    } catch (e) {
      print("Erro ao carregar tarefas: $e");
    }
  }
}
