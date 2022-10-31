import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jsonplaceholder_bloc/features/todo/todo_repository_impl.dart';

import '../../../model/data.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoRepository _todoRepository;
  TodoBloc(this._todoRepository) : super(TodoInitial()) {
    on<TodoEvent>((event, emit) async {
      try {
        List<Data> data = await _todoRepository.fetchData();
        emit(TodoLoaded(data: data));
      } on Exception {
        emit(const TodoError(
            message: "Couldn't fetch the list, please try again later!"));
      }
    });
  }
}
