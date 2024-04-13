import 'dart:convert';

import 'package:todo_task/Features/Authentication/Domain/Entity/user.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoItem.dart';
import 'package:todo_task/Features/Todo/Domain/Entity/todoEntity.dart';

class TodoModel extends TodoEntity {
  TodoModel({super.todos, super.total, super.skip, super.limit});
  TodoModel copyWith({
    List<TodoItemModel>? todos,
    int? total,
    int? skip,
    int? limit,
  }) {
    return TodoModel(
      todos: todos ?? this.todos,
      total: total ?? this.total,
      skip: skip ?? this.skip,
      limit: limit ?? this.limit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'todos': todos!.map((x) => x.toMap()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    final todoitems = <TodoItemModel>[];
    if (map['todos'] != null) {
      map['todos'].forEach((v) {
        todoitems.add(TodoItemModel.fromMap(v));
      });
    }
    return TodoModel(
      todos: todoitems,
      total: map['total'] as int,
      skip: map['skip'] as int,
      limit: map['limit'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
