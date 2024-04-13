import 'package:dartz/dartz.dart';
import 'package:todo_task/Features/Todo/Domain/Entity/todoEntity.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';
import '../../../../../Core/error.dart';

class GetTasksUseCase {
  TodoRepo repo;
  GetTasksUseCase({required this.repo});
  Future<Either<Failure, TodoEntity>> call({
    required String userid,
    String? limit,
    String? skip,
  }) {
    return repo.getTasks(limit: limit, skip: skip, userid: userid);
  }
}
