// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on _AuthControllerBase, Store {
  late final _$singInSucessAtom =
      Atom(name: '_AuthControllerBase.singInSucess', context: context);

  @override
  bool get singInSucess {
    _$singInSucessAtom.reportRead();
    return super.singInSucess;
  }

  @override
  set singInSucess(bool value) {
    _$singInSucessAtom.reportWrite(value, super.singInSucess, () {
      super.singInSucess = value;
    });
  }

  late final _$repositoryAtom =
      Atom(name: '_AuthControllerBase.repository', context: context);

  @override
  IauthRepository? get repository {
    _$repositoryAtom.reportRead();
    return super.repository;
  }

  @override
  set repository(IauthRepository? value) {
    _$repositoryAtom.reportWrite(value, super.repository, () {
      super.repository = value;
    });
  }

  late final _$signInWithEmailAndPasswordAsyncAction = AsyncAction(
      '_AuthControllerBase.signInWithEmailAndPassword',
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
singInSucess: ${singInSucess},
repository: ${repository}
    ''';
  }
}
