import 'package:flutter_test/flutter_test.dart';
import 'package:image_convert/app/modules/authentication/data/data_sources/auth_data_source.dart';
import 'package:image_convert/app/modules/authentication/data/firebase_authentication/auth.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements Auth {}

void main() {
  late AuthDataSource authDataSource;
  late MockAuth mockAuth;

  setUp(() {
    mockAuth = MockAuth();
    authDataSource = AuthDataSource(auth: mockAuth);
  });

  test('signInWithEmailAndPassword calls auth.signInWithEmailAndPassword', () async {
    const email = 'test@example.com';
    const password = 'password123';

    when(mockAuth.signInWithEmailAndPassword(email: 'test@example.com', password: 'password123')).thenAnswer((_) async => Future.value());

    await authDataSource.signInWithEmailAndpassword(email: email, password: password);

    verify(mockAuth.signInWithEmailAndPassword(email: email, password: password)).called(1);
  });

  test('createUserWithEmailAndPassword calls auth.createUserWithEmailAndPassword', () async {
    const email = 'test@example.com';
    const password = 'password123';

    when(mockAuth.createUserWithEmailAndPassword(email: '', password: 'password123')).thenAnswer((_) async => Future.value());

    await authDataSource.createUserWithEmailAndPassword(email: email, password: password);

    verify(mockAuth.createUserWithEmailAndPassword(email: email, password: password)).called(1);
  });
}
