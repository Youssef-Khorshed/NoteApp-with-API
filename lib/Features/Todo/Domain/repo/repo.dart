import 'package:dartz/dartz.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';

abstract class TodoRepo {
  Future<Either<Failure, Unit>> addTask(
      {required String userid, required String task, bool? completed});
  Future<Either<Failure, Unit>> deleteTask({required String taskid});
  Future<Either<Failure, Unit>> updateTask(
      {required String taskid, bool? completed});
  Future<Either<Failure, TodoModel>> getTasks({
    required String userid,
    String? limit,
    String? skip,
  });
}
