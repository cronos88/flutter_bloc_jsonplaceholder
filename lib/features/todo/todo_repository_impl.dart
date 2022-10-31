import '../../model/data.dart';
import 'todo_service.dart';

class TodoRepositoryImpl extends TodoRepository {
  TodoService service = TodoService();

  @override
  Future<List<Data>> fetchData() {
    return service.fetchData();
  }
}

abstract class TodoRepository {
  Future<List<Data>> fetchData();
}
