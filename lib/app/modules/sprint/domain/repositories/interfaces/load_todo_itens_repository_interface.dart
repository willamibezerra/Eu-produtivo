abstract class IloadTodoItensRepository {
  IloadTodoItensRepository();
  Future<List<String>> loadTaskFromDatabaseRepository(
      {required String tableTitle});
}
