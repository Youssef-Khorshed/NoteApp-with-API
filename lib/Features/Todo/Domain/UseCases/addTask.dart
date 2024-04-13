import 'package:dartz/dartz.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';

class AddTaskUseCase {
  TodoRepo repo;
  AddTaskUseCase({required this.repo});
  Future<Either<Failure, Unit>> call(
      {required String userid, required String task, bool? completed}) {
    return repo.addTask(task: task, userid: userid, completed: completed);
  }
}
