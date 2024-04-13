// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';
import 'package:todo_task/Features/Todo/Domain/Entity/todoItemEntity.dart';

// ignore: must_be_immutable
class TodoEntity extends Equatable {
  List<TodosItem>? todos;
  int? total;
  int? skip;
  int? limit;
  TodoEntity({
    this.todos,
    this.total,
    this.skip,
    this.limit,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [limit, skip, todos, total];
}
