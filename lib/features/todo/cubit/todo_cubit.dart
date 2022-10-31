import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/data.dart';
import '../todo_repository_impl.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final TodoRepository todoRepository;
  TodoCubit(this.todoRepository) : super(TodoInitial());

  Future<void> getData() async {
    try {
      List<Data> data = await todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      emit(const TodoError(
          message: "Could not fetch the list, please try again later!"));
    }
  }
}
