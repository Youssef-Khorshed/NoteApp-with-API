import 'dart:convert';

import 'package:todo_task/Features/Todo/Domain/Entity/todoItemEntity.dart';

class TodoItemModel extends TodosItem {
  TodoItemModel({
    super.id,
    super.todo,
    super.completed,
    super.userId,
  });

  TodoItemModel copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    return TodoItemModel(
      id: id ?? this.id,
      todo: todo ?? this.todo,
      completed: completed ?? this.completed,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }

  factory TodoItemModel.fromMap(Map<String, dynamic> map) {
    return TodoItemModel(
      id: map['id'] != null ? map['id'] as int : null,
      todo: map['todo'] != null ? map['todo'] as String : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItemModel.fromJson(String source) =>
      TodoItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todos(id: $id, todo: $todo, completed: $completed, userId: $userId)';
  }

  @override
  bool operator ==(covariant TodoItemModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.todo == todo &&
        other.completed == completed &&
        other.userId == userId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ todo.hashCode ^ completed.hashCode ^ userId.hashCode;
  }
}
