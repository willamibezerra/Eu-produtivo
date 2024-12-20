// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  late final _$signInSucessAtom =
      Atom(name: 'AuthControllerBase.signInSucess', context: context);

  @override
  bool? get signInSucess {
    _$signInSucessAtom.reportRead();
    return super.signInSucess;
  }

  @override
  set signInSucess(bool? value) {
    _$signInSucessAtom.reportWrite(value, super.signInSucess, () {
      super.signInSucess = value;
    });
  }

  late final _$createAccountSucessAtom =
      Atom(name: 'AuthControllerBase.createAccountSucess', context: context);

  @override
  bool? get createAccountSucess {
    _$createAccountSucessAtom.reportRead();
    return super.createAccountSucess;
  }

  @override
  set createAccountSucess(bool? value) {
    _$createAccountSucessAtom.reportWrite(value, super.createAccountSucess, () {
      super.createAccountSucess = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AuthControllerBase.isLoading', context: context);

  @override
  bool? get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool? value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$loadSignFutureAtom =
      Atom(name: 'AuthControllerBase.loadSignFuture', context: context);

  @override
  ObservableFuture<void>? get loadSignFuture {
    _$loadSignFutureAtom.reportRead();
    return super.loadSignFuture;
  }

  @override
  set loadSignFuture(ObservableFuture<void>? value) {
    _$loadSignFutureAtom.reportWrite(value, super.loadSignFuture, () {
      super.loadSignFuture = value;
    });
  }

  late final _$signFutureAsyncAction =
      AsyncAction('AuthControllerBase.signFuture', context: context);

  @override
  Future<void> signFuture({required String email, required String password}) {
    return _$signFutureAsyncAction
        .run(() => super.signFuture(email: email, password: password));
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      'AuthControllerBase.signInWithEmailAndPassword',
      context: context);

  @override
  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) {
    return _$signInWithEmailAndPasswordAsyncAction.run(() =>
        super.signInWithEmailAndPassword(email: email, password: password));
  }

  @override
  String toString() {
    return '''
signInSucess: ${signInSucess},
createAccountSucess: ${createAccountSucess},
isLoading: ${isLoading},
loadSignFuture: ${loadSignFuture}
    ''';
  }
}
