// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RegisterUserController on RegisterUserControllerBase, Store {
  late final _$repositoryAtom =
      Atom(name: 'RegisterUserControllerBase.repository', context: context);

  @override
  IuserAuthenticationVerificationRepository get repository {
    _$repositoryAtom.reportRead();
    return super.repository;
  }

  @override
  set repository(IuserAuthenticationVerificationRepository value) {
    _$repositoryAtom.reportWrite(value, super.repository, () {
      super.repository = value;
    });
  }

  late final _$registeredAtom =
      Atom(name: 'RegisterUserControllerBase.registered', context: context);

  @override
  bool? get registered {
    _$registeredAtom.reportRead();
    return super.registered;
  }

  @override
  set registered(bool? value) {
    _$registeredAtom.reportWrite(value, super.registered, () {
      super.registered = value;
    });
  }

  late final _$errorOnLoadAtom =
      Atom(name: 'RegisterUserControllerBase.errorOnLoad', context: context);

  @override
  bool? get errorOnLoad {
    _$errorOnLoadAtom.reportRead();
    return super.errorOnLoad;
  }

  @override
  set errorOnLoad(bool? value) {
    _$errorOnLoadAtom.reportWrite(value, super.errorOnLoad, () {
      super.errorOnLoad = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('RegisterUserControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$verifyUserAsyncAction =
      AsyncAction('RegisterUserControllerBase.verifyUser', context: context);

  @override
  Future<void> verifyUser() {
    return _$verifyUserAsyncAction.run(() => super.verifyUser());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('RegisterUserControllerBase.deleteUser', context: context);

  @override
  Future<void> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  @override
  String toString() {
    return '''
repository: ${repository},
registered: ${registered},
errorOnLoad: ${errorOnLoad}
    ''';
  }
}
