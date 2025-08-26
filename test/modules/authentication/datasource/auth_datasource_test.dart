// test/lib/app/modules/auth/data/auth_repository_test.dart
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:image_convert/app/modules/auth/data/auth_repository.dart';
import 'package:image_convert/app/modules/auth/data/auth_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Mock class for IauthDataSource
class MockAuthDataSource extends Mock implements IauthDataSource {}

void main() {
  late AuthRepository authRepository;
  late MockAuthDataSource mockAuthDataSource;

  setUp(() {
    mockAuthDataSource = MockAuthDataSource();
    authRepository = AuthRepository(dataSource: mockAuthDataSource);
  });

  group('signInWithEmailAndpasswordRepository', () {
    test('returns Right when signIn is successful', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to return a Future<void>
      when(mockAuthDataSource.signInWithEmailAndpassword(email: anyNamed('email'), password: anyNamed('password'))).thenAnswer((_) async => Future.value());

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, const Right('Autenticação efetuada com sucesso'));
    });

    test('returns Left with error message when FirebaseAuthException is thrown', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to throw a FirebaseAuthException
      when(mockAuthDataSource.signInWithEmailAndpassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(FirebaseAuthException(message: 'Erro de autenticação', code: 'auth-error'));

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, Left('Erro de autenticação'));
    });

    test('returns Left with default error message when an exception is thrown', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to throw a generic exception
      when(mockAuthDataSource.signInWithEmailAndpassword(email: anyNamed('email'), password: anyNamed('password'))).thenThrow(Exception());

      final result = await authRepository.signInWithEmailAndpasswordRepository(email: email, password: password);

      expect(result, Left('Falha ao efetuar a autenticação'));
    });
  });

  group('createUserWithEmailAndPasswordRepository', () {
    test('returns Right when user creation is successful', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to return a Future<void>
      when(mockAuthDataSource.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password'))).thenAnswer((_) async => Future.value());

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, const Right('Autenticação efetuada com sucesso'));
    });

    test('returns Left with error message when FirebaseAuthException is thrown', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to throw a FirebaseAuthException
      when(mockAuthDataSource.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password')))
          .thenThrow(FirebaseAuthException(message: 'Erro de criação de usuário', code: 'auth-error'));

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, Left('Erro de criação de usuário'));
    });

    test('returns Left with default error message when an exception is thrown', () async {
      final email = 'test@example.com';
      final password = 'password123';

      // Configure the mock to throw a generic exception
      when(mockAuthDataSource.createUserWithEmailAndPassword(email: anyNamed('email'), password: anyNamed('password'))).thenThrow(Exception());

      final result = await authRepository.createUserWithEmailAndPasswordRepository(email: email, password: password);

      expect(result, Left('Falha ao efetuar a autenticação'));
    });
  });
}
