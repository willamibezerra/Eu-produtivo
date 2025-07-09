import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
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
  @observable
  ObservableFuture<void>? loadconcludesFuture;
 Auth firebaseAuth;
  ItensSprintControllerBase({
    required this.firebaseAuth,
    required this.todoItensRepository,
    this.resultInProgress,
    this.resultInitial,
    this.conclued,
    this.loadTaskFuture,
  
  });
 String get  uid=> firebaseAuth.currentUser?.uid ?? '';



DatabaseReference get refToDo =>
    FirebaseDatabase.instance.ref("users/$uid/to_do");
DatabaseReference get refInProgress =>
    FirebaseDatabase.instance.ref("users/$uid/progress");

DatabaseReference get refConcludes =>
    FirebaseDatabase.instance.ref("users/$uid/concludes");

  @action
  Future<void> toDoItem(String item, int? index) async {
    if(item.isEmpty)return;
    if (resultInitial != null) {
      resultInitial!.add(item);
    } else {
      resultInitial = [item];
    }
    if (resultInProgress != null && index != null) {
      deleteItenInProgress(index);
    }
    await refToDo.update({"itens": resultInitial});
  }

  @action
  Future<void> loadInProgress(String itens, int index, bool isRight) async {

    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.add(itens);
    } else {
      resultInProgress = [itens];
    }

    if (isRight && resultInitial != null) {
      deleteItenToDO(index);
    }
    await refInProgress.update({"itens": resultInProgress});
  }

  @action
  Future<void> changeToConclued(String itens, int index) async {

    if (conclued != null && conclued!.isNotEmpty) {
      conclued!.add(itens);
    } else {
      conclued = [itens];
    }

    if (resultInProgress != null) {
      deleteItenInProgress(index);
    }
    await refConcludes.update({"itens": conclued});
  }

  @action
  Future<void> deleteItenToDO(int index) async {
    if (  resultInitial != null && resultInitial!.isNotEmpty) {
      resultInitial!.removeAt(index);
        await refToDo.update({"itens": resultInitial});
    }
  }

  @action
  Future<void> deleteItenInProgress(int index) async {
    if (resultInProgress != null && resultInProgress!.isNotEmpty) {
      resultInProgress!.removeAt(index);
      await refInProgress.update({"itens": resultInProgress});
    }
  }

  @action
  Future<void> deleteconcludes(int index) async {
    if (conclued != null && conclued!.isNotEmpty) {
      conclued!.removeAt(index);
      await refConcludes.update({"itens": conclued});
    }
  }

  @action
  Future<void> loadTask() async {
    try {
      loadTaskFuture = ObservableFuture(loadTaskFromDatabase());
      loadprogessFuture = ObservableFuture(loadProgressTaskFromDatabase());
      loadconcludesFuture = ObservableFuture(loadConcludesTaskFromDatabase());

      await loadTaskFuture;
      await loadprogessFuture;
      await loadconcludesFuture;
    } catch (e) {}
  }

  @action
  Future<void> loadTaskFromDatabase() async {
    resultInitial = await todoItensRepository.loadTaskFromDatabaseRepository(
        tableTitle: 'users/$uid/to_do');
  }

  @action
  Future<void> loadProgressTaskFromDatabase() async {
    resultInProgress = await todoItensRepository.loadTaskFromDatabaseRepository(
        tableTitle: 'users/$uid/progress');
  }

  @action
  Future<void> loadConcludesTaskFromDatabase() async {
    conclued = await todoItensRepository.loadTaskFromDatabaseRepository(
        tableTitle: 'users/$uid/concludes');
  }
}
