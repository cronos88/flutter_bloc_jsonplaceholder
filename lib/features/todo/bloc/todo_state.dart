part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Data> data;
  const TodoLoaded({required this.data});
}

class TodoError extends TodoState {
  final String message;
  const TodoError({required this.message});
}
