import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Core/exception.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Authentication/Data/Model/usermodel.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';

abstract class RemoteTodo {
  Future<Either<Exception, Unit>> addTask(
      {required String userid, required String task, bool? completed});
  Future<Either<Exception, Unit>> deleteTask({required String taskid});
  Future<Either<Exception, Unit>> updateTask(
      {required String taskid, bool? completed});
  Future<Either<Exception, TodoModel>> getTasks({
    required String userid,
    String? limit,
    String? skip,
  });
}

class RemoteTodoImp extends RemoteTodo {
  Dio dio;
  RemoteTodoImp({required this.dio});

  @override
  Future<Either<Exception, Unit>> addTask(
      {required String userid, required String task, bool? completed}) async {
    try {
      final resopnse = await dio.post(addTodo,
          data: {
            "todo": task,
            "completed": completed ?? false,
            "userId": userid,
          },
          options: Options(headers: headers()));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        return const Right(unit);
      } else {
        return Left(AddTodoException());
      }
    } catch (error) {
      return Left(AddTodoException());
    }
  }

  @override
  Future<Either<Exception, Unit>> deleteTask({required String taskid}) async {
    try {
      final resopnse = await dio.delete(delete_update(todoID: taskid),
          options: Options(headers: headers()));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        return const Right(unit);
      } else {
        return Left(DeleteTodoException());
      }
    } catch (error) {
      return Left(DeleteTodoException());
    }
  }

  @override
  Future<Either<Exception, TodoModel>> getTasks(
      {required String userid, String? limit, String? skip}) async {
    try {
      final resopnse = await dio.get(getTodo(limit: limit, skip: skip),
          options: Options(headers: headers()));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        final todos = TodoModel.fromMap(resopnse.data);
        return Right(todos);
      } else {
        return Left(GetTodoException());
      }
    } catch (error) {
      return Left(GetTodoException());
    }
  }

  @override
  Future<Either<Exception, Unit>> updateTask(
      {required String taskid, bool? completed}) async {
    try {
      final resopnse = await dio.put(delete_update(todoID: taskid),
          options: Options(headers: headers()));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        return const Right(unit);
      } else {
        return Left((UpdateTodoException()));
      }
    } catch (error) {
      return Left(UpdateTodoException());
    }
  }
}
