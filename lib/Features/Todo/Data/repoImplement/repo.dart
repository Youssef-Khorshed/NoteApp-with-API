import 'package:dartz/dartz.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Core/internet.dart';
import 'package:todo_task/Features/Todo/Data/DataSource/local.dart';
import 'package:todo_task/Features/Todo/Data/DataSource/remote.dart';
import 'package:todo_task/Features/Todo/Data/Model/todoModel.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';

class TodoRepoImp extends TodoRepo {
  NetworkInfo networkInfo;
  LocalTodo localTodo;
  RemoteTodo remote;
  TodoRepoImp(
      {required this.remote,
      required this.localTodo,
      required this.networkInfo});

  @override
  Future<Either<Failure, Unit>> addTask(
      {required String userid, required String task, bool? completed}) async {
    if (await networkInfo.isConnected) {
      try {
        await remote.addTask(userid: userid, task: task);
        return const Right(unit);
        // ignore: empty_catches
      } catch (error) {
        return Left(AddTaskFailure());
      }
    } else {
      return Left(AddTaskFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask({required String taskid}) async {
    if (await networkInfo.isConnected) {
      try {
        await remote.deleteTask(taskid: taskid);
        return const Right(unit);
        // ignore: empty_catches
      } catch (error) {
        return Left(DeleteTaskFailure());
      }
    } else {
      return Left(DeleteTaskFailure());
    }
  }

  @override
  Future<Either<Failure, TodoModel>> getTasks(
      {required String userid, String? limit, String? skip}) async {
    if (await networkInfo.isConnected) {
      try {
        final data =
            await remote.getTasks(userid: userid, limit: limit, skip: skip);

        return data.fold((l) => Left(GetTaskFailure()), (todos) async {
          final cash = await localTodo.cashTasks(todos: todos);
          cash.fold((l) => Left(CashFailure()), (r) => const Right(unit));
          final x = await localTodo.getcashedUser();
          print('======================');
          print(x);
          return Right(todos);
        });
        // ignore: empty_catches
      } catch (error) {
        return Left(GetTaskFailure());
      }
    } else {
      final x = await localTodo.getcashedUser();
      print('======================');
      print(x);
      return x.fold((l) => Left(CashFailure()), (r) => Right(r));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateTask(
      {required String taskid, bool? completed}) async {
    if (await networkInfo.isConnected) {
      try {
        await remote.updateTask(taskid: taskid);
        return const Right(unit);
        // ignore: empty_catches
      } catch (error) {
        return Left(UpdateTaskFailure());
      }
    } else {
      return Left(UpdateTaskFailure());
    }
  }
}
