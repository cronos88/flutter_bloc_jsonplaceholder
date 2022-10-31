// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'todo_cubit.dart';

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
