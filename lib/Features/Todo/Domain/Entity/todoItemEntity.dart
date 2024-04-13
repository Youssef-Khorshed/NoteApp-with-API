// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class TodosItem extends Equatable {
  int? id;
  String? todo;
  bool? completed;
  int? userId;
  TodosItem({
    this.id,
    this.todo,
    this.completed,
    this.userId,
  });

  TodosItem copyWith({
    int? id,
    String? todo,
    bool? completed,
    int? userId,
  }) {
    return TodosItem(
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

  factory TodosItem.fromMap(Map<String, dynamic> map) {
    return TodosItem(
      id: map['id'] != null ? map['id'] as int : null,
      todo: map['todo'] != null ? map['todo'] as String : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
      userId: map['userId'] != null ? map['userId'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodosItem.fromJson(String source) =>
      TodosItem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todos(id: $id, todo: $todo, completed: $completed, userId: $userId)';
  }

  @override
  bool operator ==(covariant TodosItem other) {
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

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        todo,
        completed,
        userId,
      ];
}
