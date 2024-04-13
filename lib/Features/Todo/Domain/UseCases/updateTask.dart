import 'package:dartz/dartz.dart';
import 'package:todo_task/Features/Authentication/Domain/repo/repo.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';
import '../../../../../Core/error.dart';

class UpateTasksUseCase {
  TodoRepo repo;
  UpateTasksUseCase({required this.repo});
  Future<Either<Failure, Unit>> call(
      {required String taskid, bool? completed}) {
    return repo.updateTask(taskid: taskid, completed: completed);
  }
}
