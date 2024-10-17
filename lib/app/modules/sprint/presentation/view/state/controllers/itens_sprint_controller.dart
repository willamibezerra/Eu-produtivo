import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:mobx/mobx.dart';

import 'package:image_convert/app/modules/sprint/domain/repositories/interfaces/load_todo_itens_repository_interface.dart';

part 'itens_sprint_controller.g.dart';

class ItensSprintController = ItensSprintControllerBase
    with _$ItensSprintController;

abstract class ItensSprintControllerBase with Store {
  final IloadTodoItensRepository todoItensRepository;
  @observable
  List<String>? resultInProgress;
  @observable
  List<String>? resultInitial;
  @observable
  List<String>? conclued;
  @observable
  ObservableFuture<void>? loadTaskFuture;
  @observable
  ObservableFuture<void>? loadprogessFuture;

  ItensSprintControllerBase({
    required this.todoItensRepository,
    this.resultInProgress,
    this.resultInitial,
    this.conclued,
    this.loadTaskFuture,
  });

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
  Future<void> loadInProgress(String itens, int index, bool isRight) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("progress");

    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.add(itens);
    } else {
      resultInProgress = [itens];
    }

    if (isRight && resultInitial != null) {
      deleteItenToDO(index);
    }
    await ref.update({"itens": resultInProgress});
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
      loadTaskFuture = ObservableFuture(loadTaskFromDatabase());
      loadprogessFuture = ObservableFuture(loadProgressTaskFromDatabase());
      await loadTaskFuture;
      await loadprogessFuture;
    } catch (e) {
      print("Erro ao carregar tarefas: $e");
    }
  }

  @action
  Future<void> loadTaskFromDatabase() async {
    resultInitial = await todoItensRepository.loadTaskFromDatabaseRepository(
        tableTitle: 'to_do');
  }

  @action
  Future<void> loadProgressTaskFromDatabase() async {
    resultInProgress = await todoItensRepository.loadTaskFromDatabaseRepository(
        tableTitle: 'progress');
  }
}
