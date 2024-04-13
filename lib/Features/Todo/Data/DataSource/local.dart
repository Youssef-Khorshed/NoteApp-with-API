import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/Core/exception.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';
import 'package:todo_task/Features/Todo/Domain/Entity/todoEntity.dart';

abstract class LocalTodo {
  Future<Either<Exception, Unit>> cashTasks({required TodoModel todos});
  Future<Either<Exception, TodoModel>> getcashedUser();
}

class LocalTodoImp extends LocalTodo {
  SharedPreferences sharedPreferences;
  LocalTodoImp({required this.sharedPreferences});

  @override
  Future<Either<Exception, Unit>> cashTasks({required TodoModel todos}) async {
    try {
      await sharedPreferences.setString(todoKey, jsonEncode(todos.toMap()));
      return const Right(unit);
    } catch (error) {
      return Left(CashException());
    }
  }

  @override
  Future<Either<Exception, TodoModel>> getcashedUser() async {
    try {
      String? todo = sharedPreferences.getString(todoKey);

      if (todo != null) {
        return Right(TodoModel.fromMap(jsonDecode(todo)));
      } else {
        return Left(CashException());
      }
    } catch (error) {
      return Left(CashException());
    }
  }
}
