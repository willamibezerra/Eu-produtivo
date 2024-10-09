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
  List<Widget>? get resultInProgress {
    _$resultInProgressAtom.reportRead();
    return super.resultInProgress;
  }

  @override
  set resultInProgress(List<Widget>? value) {
    _$resultInProgressAtom.reportWrite(value, super.resultInProgress, () {
      super.resultInProgress = value;
    });
  }

  late final _$resultInitialAtom =
      Atom(name: 'ItensSprintControllerBase.resultInitial', context: context);

  @override
  List<Widget>? get resultInitial {
    _$resultInitialAtom.reportRead();
    return super.resultInitial;
  }

  @override
  set resultInitial(List<Widget>? value) {
    _$resultInitialAtom.reportWrite(value, super.resultInitial, () {
      super.resultInitial = value;
    });
  }

  late final _$concluedAtom =
      Atom(name: 'ItensSprintControllerBase.conclued', context: context);

  @override
  List<Widget>? get conclued {
    _$concluedAtom.reportRead();
    return super.conclued;
  }

  @override
  set conclued(List<Widget>? value) {
    _$concluedAtom.reportWrite(value, super.conclued, () {
      super.conclued = value;
    });
  }

  @override
  String toString() {
    return '''
resultInProgress: ${resultInProgress},
resultInitial: ${resultInitial},
conclued: ${conclued}
    ''';
  }
}
