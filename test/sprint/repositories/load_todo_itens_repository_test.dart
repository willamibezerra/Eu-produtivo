// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:image_convert/app/modules/sprint/domain/repositories/load_todo_itens_reposirory.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import '../mocks/mocked_load_todo_itens_repository.mocks.mocks.dart';

// void main() async {
//   late MockFirebaseDatabase firebaseDatabase;
//   late LoadTodoItensReposirory repository;
//   late MockDatabaseReference mockChildReference;
//   late MockDataSnapshot mockDataSnapshot;
//   setUp(() {
//     firebaseDatabase = MockFirebaseDatabase();
//     mockChildReference = MockDatabaseReference();
//     mockDataSnapshot = MockDataSnapshot();
//     repository = LoadTodoItensReposirory();
//   });

//   group('LoadTodoItensReposirory', () {
//     test('should return list of tasks when snapshot exists', () async {
//       const tableTitle = 'test_table';
//       final expectedTasks = ['Task 1', 'Task 2', 'Task 3'];
//       final mockData = {'itens': expectedTasks};
//       when(mockChildReference.get()).thenAnswer((_) async => mockDataSnapshot);
//       when(mockDataSnapshot.exists).thenReturn(true);
//       when(mockDataSnapshot.value).thenReturn(mockData);

//       final result = await repository.loadTaskFromDatabaseRepository(tableTitle: tableTitle);
//       expect(result, equals(expectedTasks));
//       verify(mockChildReference.get()).called(1);
//     });

//     test('should return empty list when snapshot does not exist', () async {
//       const tableTitle = 'non_existent_table';

//       when(mockChildReference.get()).thenAnswer((_) async => mockDataSnapshot);
//       when(mockDataSnapshot.exists).thenReturn(false);

//       final result = await repository.loadTaskFromDatabaseRepository(tableTitle: tableTitle);
//       expect(result, isEmpty);
//       verify(mockChildReference.get()).called(1);
//     });

//     test('should handle different data formats correctly', () async {
//       const tableTitle = 'test_table';
//       final expectedTasks = ['Task 1', 'Task 2', 'Task 3'];

//       final mockData = {Object(): Object(), 'itens': expectedTasks};

//       when(mockChildReference.get()).thenAnswer((_) async => mockDataSnapshot);
//       when(mockDataSnapshot.exists).thenReturn(true);
//       when(mockDataSnapshot.value).thenReturn(mockData);
//       final result = await repository.loadTaskFromDatabaseRepository(tableTitle: tableTitle);
//       expect(result, equals(expectedTasks));
//     });
//   });
// }
//TODO o arquivo não é testável
