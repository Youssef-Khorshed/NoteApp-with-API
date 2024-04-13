import 'package:dartz/dartz.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';
import '../../../../../Core/error.dart';

class DeleteTaskUseCase {
  TodoRepo repo;
  DeleteTaskUseCase({required this.repo});
  Future<Either<Failure, Unit>> call({required String taskid}) {
    return repo.deleteTask(taskid: taskid);
  }
}
