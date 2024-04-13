import 'package:dartz/dartz.dart';
import 'package:todo_task/Core/error.dart';
import 'package:todo_task/Core/exception.dart';
import 'package:todo_task/Core/internet.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Authentication/Data/DataSource/local.dart';
import 'package:todo_task/Features/Authentication/Data/DataSource/remote.dart';
import 'package:todo_task/Features/Authentication/Domain/Entity/user.dart';
import 'package:todo_task/Features/Authentication/Domain/repo/repo.dart';

class AuthRepoImp extends AuthRepo {
  NetworkInfo networkInfo;
  LocalAuth localAuth;
  AuthRemote remote;
  AuthRepoImp(
      {required this.remote,
      required this.localAuth,
      required this.networkInfo});
  @override
  Future<Either<Failure, UserEntiy>> login(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final login = await remote.login(email: email, password: password);
        return login.fold((l) => Left(AuthFailure()), (r) async {
          final cash = await localAuth.cashUser(user: r);
          cash.fold((l) => Left(CashFailure()), (r) {});
          return Right(r);
        });
      } on AuthException {
        return Left(AuthFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
