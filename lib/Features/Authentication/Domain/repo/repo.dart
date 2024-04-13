import 'package:dartz/dartz.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Features/Authentication/Domain/Entity/user.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntiy>> login(
      {required String email, required String password});
}
