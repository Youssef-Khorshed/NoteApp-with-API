// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_task/Core/getFailure.dart';
import 'package:todo_task/Features/Todo/Domain/Entity/todoEntity.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/addTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/deleteTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/getTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/updateTask.dart';
part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  AddTaskUseCase addTaskUseCase;
  DeleteTaskUseCase deleteTaskUseCase;
  UpateTasksUseCase updateTaskUseCase;
  GetTasksUseCase getTaskUseCase;
  TodoEntity? todos_search;
  bool change = true;
  TextEditingController search_controller = TextEditingController();

  TodoEntity? todoEntity;
  TodoBloc({
    required this.addTaskUseCase,
    required this.deleteTaskUseCase,
    required this.getTaskUseCase,
    required this.updateTaskUseCase,
  }) : super(TodoInitial()) {
    on<TodoEvent>;
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
    on<UpdateTaskEvent>(updateTask);
    on<GetTaskEvent>(getTask);
    on<SearchData>(search);
  }

  void cleartext() {
    search_controller.clear();
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<TodoState> emit) async {
    final res = await addTaskUseCase.call(
        userid: event.userid, task: event.task, completed: event.completed);
    res.fold(
        (l) =>
            emit(AddTodoFail(message: getfailure(failure: l), change: change)),
        (r) => emit(TodoSuccrss(change: change)));
  }

  FutureOr<void> deleteTask(
      DeleteTaskEvent event, Emitter<TodoState> emit) async {
    final res = await deleteTaskUseCase.call(taskid: event.taskid);
    res.fold(
        (l) => emit(
            DeleteTodoFail(message: getfailure(failure: l), change: change)),
        (r) => emit(TodoSuccrss(change: change)));
  }

  FutureOr<void> updateTask(
      UpdateTaskEvent event, Emitter<TodoState> emit) async {
    final res = await updateTaskUseCase.call(taskid: event.taskid);
    res.fold(
        (l) => emit(
            UpdateTodoFail(message: getfailure(failure: l), change: change)),
        (r) => emit(TodoSuccrss(change: change)));
  }

  FutureOr<void> getTask(GetTaskEvent event, Emitter<TodoState> emit) async {
    change = false;
    emit(TodoLoading(change: change));
    final res = await getTaskUseCase.call(
        userid: event.userid, limit: event.limit, skip: event.skip);
    res.fold((l) {
      change = true;

      emit(GetTodoFail(message: getfailure(failure: l), change: change));
    }, (r) {
      todoEntity = todos_search = r;
      change = true;

      emit(GetTodoSuccrss(change: change, todos: todoEntity!));
    });
  }

  FutureOr<void> search(SearchData event, Emitter<TodoState> emit) {
    if (todos_search != null) {
      todos_search!.todos!.forEach((element) {
        element.todo!.contains(event.query!);
      });
    }
  }
}
