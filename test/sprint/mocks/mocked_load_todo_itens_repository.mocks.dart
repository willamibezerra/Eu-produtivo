import 'package:firebase_database/firebase_database.dart';
import 'package:mockito/annotations.dart';

@GenerateNiceMocks(<MockSpec<dynamic>>[
  MockSpec<FirebaseDatabase>(),
  MockSpec<DatabaseReference>(),
  MockSpec<DataSnapshot>(),
])
class MockLoadTodoItensReposirory {}
