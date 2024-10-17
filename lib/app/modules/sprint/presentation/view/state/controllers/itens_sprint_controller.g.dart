// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'itens_sprint_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItensSprintController on ItensSprintControllerBase, Store {
  late final _$resultInProgressAtom = Atom(
      name: 'ItensSprintControllerBase.resultInProgress', context: context);

  @override
  List<String>? get resultInProgress {
    _$resultInProgressAtom.reportRead();
    return super.resultInProgress;
  }

  @override
  set resultInProgress(List<String>? value) {
    _$resultInProgressAtom.reportWrite(value, super.resultInProgress, () {
      super.resultInProgress = value;
    });
  }

  late final _$resultInitialAtom =
      Atom(name: 'ItensSprintControllerBase.resultInitial', context: context);

  @override
  List<String>? get resultInitial {
    _$resultInitialAtom.reportRead();
    return super.resultInitial;
  }

  @override
  set resultInitial(List<String>? value) {
    _$resultInitialAtom.reportWrite(value, super.resultInitial, () {
      super.resultInitial = value;
    });
  }

  late final _$concluedAtom =
      Atom(name: 'ItensSprintControllerBase.conclued', context: context);

  @override
  List<String>? get conclued {
    _$concluedAtom.reportRead();
    return super.conclued;
  }

  @override
  set conclued(List<String>? value) {
    _$concluedAtom.reportWrite(value, super.conclued, () {
      super.conclued = value;
    });
  }

  late final _$loadTaskFutureAtom =
      Atom(name: 'ItensSprintControllerBase.loadTaskFuture', context: context);

  @override
  ObservableFuture<void>? get loadTaskFuture {
    _$loadTaskFutureAtom.reportRead();
    return super.loadTaskFuture;
  }

  @override
  set loadTaskFuture(ObservableFuture<void>? value) {
    _$loadTaskFutureAtom.reportWrite(value, super.loadTaskFuture, () {
      super.loadTaskFuture = value;
    });
  }

  late final _$loadprogessFutureAtom = Atom(
      name: 'ItensSprintControllerBase.loadprogessFuture', context: context);

  @override
  ObservableFuture<void>? get loadprogessFuture {
    _$loadprogessFutureAtom.reportRead();
    return super.loadprogessFuture;
  }

  @override
  set loadprogessFuture(ObservableFuture<void>? value) {
    _$loadprogessFutureAtom.reportWrite(value, super.loadprogessFuture, () {
      super.loadprogessFuture = value;
    });
  }

  late final _$toDoItemAsyncAction =
      AsyncAction('ItensSprintControllerBase.toDoItem', context: context);

  @override
  Future<void> toDoItem(String item, int? index) {
    return _$toDoItemAsyncAction.run(() => super.toDoItem(item, index));
  }

  late final _$loadInProgressAsyncAction =
      AsyncAction('ItensSprintControllerBase.loadInProgress', context: context);

  @override
  Future<void> loadInProgress(String itens, int index, bool isRight) {
    return _$loadInProgressAsyncAction
        .run(() => super.loadInProgress(itens, index, isRight));
  }

  late final _$loadTaskAsyncAction =
      AsyncAction('ItensSprintControllerBase.loadTask', context: context);

  @override
  Future<void> loadTask() {
    return _$loadTaskAsyncAction.run(() => super.loadTask());
  }

  late final _$loadTaskFromDatabaseAsyncAction = AsyncAction(
      'ItensSprintControllerBase.loadTaskFromDatabase',
      context: context);

  @override
  Future<void> loadTaskFromDatabase() {
    return _$loadTaskFromDatabaseAsyncAction
        .run(() => super.loadTaskFromDatabase());
  }

  late final _$loadProgressTaskFromDatabaseAsyncAction = AsyncAction(
      'ItensSprintControllerBase.loadProgressTaskFromDatabase',
      context: context);

  @override
  Future<void> loadProgressTaskFromDatabase() {
    return _$loadProgressTaskFromDatabaseAsyncAction
        .run(() => super.loadProgressTaskFromDatabase());
  }

  late final _$ItensSprintControllerBaseActionController =
      ActionController(name: 'ItensSprintControllerBase', context: context);

  @override
  void changeToConclued(String itens, int index) {
    final _$actionInfo = _$ItensSprintControllerBaseActionController
        .startAction(name: 'ItensSprintControllerBase.changeToConclued');
    try {
      return super.changeToConclued(itens, index);
    } finally {
      _$ItensSprintControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItenToDO(int index) {
    final _$actionInfo = _$ItensSprintControllerBaseActionController
        .startAction(name: 'ItensSprintControllerBase.deleteItenToDO');
    try {
      return super.deleteItenToDO(index);
    } finally {
      _$ItensSprintControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteItenInProgress(int index) {
    final _$actionInfo = _$ItensSprintControllerBaseActionController
        .startAction(name: 'ItensSprintControllerBase.deleteItenInProgress');
    try {
      return super.deleteItenInProgress(index);
    } finally {
      _$ItensSprintControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic deleteconcludes(int index) {
    final _$actionInfo = _$ItensSprintControllerBaseActionController
        .startAction(name: 'ItensSprintControllerBase.deleteconcludes');
    try {
      return super.deleteconcludes(index);
    } finally {
      _$ItensSprintControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resultInProgress: ${resultInProgress},
resultInitial: ${resultInitial},
conclued: ${conclued},
loadTaskFuture: ${loadTaskFuture},
loadprogessFuture: ${loadprogessFuture}
    ''';
  }
}
