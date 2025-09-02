import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/interfaces/auth_data_source_interface.dart';
import 'package:image_convert/app/modules/authentication/domain/repositories/auth_repository.dart';
import 'package:mockito/mockito.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../mocks/datasource/mocked_auth_datasource.mocks.mocks.dart';

void main() {
  late AuthRepository authRepository;
  late MockAuthDataSource mockAuthDataSource;

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    authRepository = AuthRepository(dataSource: mockAuthDataSource);
  });

  group('signInWithEmailAndpasswordRepository', () {
    test('returns Right when signIn is successful', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.signInWithEmailAndpassword(email: email, password: password)).thenAnswer((_) async => Future.value());

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, const Right('Autenticação efetuada com sucesso'));
    });

    test('returns Left with error message when FirebaseAuthException is thrown', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.signInWithEmailAndpassword(email: email, password: password))
          .thenThrow(FirebaseAuthException(message: 'Erro de autenticação', code: 'auth-error'));

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, const Left('Erro de autenticação'));
    });

    test('returns Left with default error message when an exception is thrown', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.signInWithEmailAndpassword(email: email, password: password)).thenThrow(Exception());

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, const Left('Falha ao efetuar a autenticação'));
    });
  });

  group('createUserWithEmailAndPasswordRepository', () {
    test('returns Right when user creation is successful', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.createUserWithEmailAndPassword(email: email, password: password)).thenAnswer((_) async => Future.value());

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, const Right('Autenticação efetuada com sucesso'));
    });

    test('returns Left with error message when FirebaseAuthException is thrown', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.createUserWithEmailAndPassword(email: email, password: password))
          .thenThrow(FirebaseAuthException(message: 'Erro de criação de usuário', code: 'auth-error'));

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, const Left('Erro de criação de usuário'));
    });

    test('returns Left with default error message when an exception is thrown', () async {
      const email = 'test@example.com';
      const password = 'password123';

      when(mockAuthDataSource.createUserWithEmailAndPassword(email: email, password: password)).thenThrow(Exception());

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, const Left('Falha ao efetuar a autenticação'));
    });
  });
}
