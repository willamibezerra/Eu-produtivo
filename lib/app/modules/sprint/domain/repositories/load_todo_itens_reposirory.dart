import 'package:firebase_database/firebase_database.dart';

import 'package:image_convert/app/modules/sprint/domain/repositories/interfaces/load_todo_itens_repository_interface.dart';

class LoadTodoItensReposirory implements IloadTodoItensRepository {
  LoadTodoItensReposirory();

  @override
  Future<List<String>> loadTaskFromDatabaseRepository(
      {required String tableTitle}) async {
    final DatabaseReference sprintDataBase =
        FirebaseDatabase.instance.ref().child(tableTitle);
    final snapshot = await sprintDataBase.get();
    if (snapshot.exists) {
      Map<Object?, Object?> rawMap = snapshot.value as Map<Object?, Object?>;

      Map<String, dynamic> map = rawMap.map(
        (key, value) => MapEntry(key.toString(), value),
      );

      return List<String>.from(map["itens"]);
    }
    return [];
  }
}
