part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object?> get props => [];
}

class TodoSuccrss extends TodoState {
  bool change;
  TodoSuccrss({required this.change});
  @override
  List<Object?> get props => [change];
}

class GetTodoSuccrss extends TodoState {
  bool change;
  TodoEntity todos;
  GetTodoSuccrss({required this.change, required this.todos});
  @override
  List<Object?> get props => [change, todos];
}

class AddTodoFail extends TodoState {
  String message;
  bool change;
  AddTodoFail({required this.message, required this.change});
  @override
  List<Object?> get props => [message];
}

class DeleteTodoFail extends TodoState {
  String message;
  bool change;
  DeleteTodoFail({required this.message, required this.change});
  @override
  List<Object?> get props => [message];
}

class UpdateTodoFail extends TodoState {
  String message;
  bool change;
  UpdateTodoFail({required this.message, required this.change});
  @override
  List<Object?> get props => [message];
}

class GetTodoFail extends TodoState {
  String message;
  bool change;
  GetTodoFail({required this.message, required this.change});
  @override
  List<Object?> get props => [message];
}

class TodoLoading extends TodoState {
  bool change;
  TodoLoading({required this.change});
  @override
  List<Object?> get props => [change];
}
