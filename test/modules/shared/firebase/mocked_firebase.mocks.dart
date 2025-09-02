import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<FirebaseDatabase>(),
  MockSpec<FirebaseAuth>(),
])
class MockedFirebase {}
