import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/Core/exception.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Authentication/Domain/Entity/user.dart';

abstract class LocalAuth {
  Future<Either<Exception, Unit>> cashUser({required UserEntiy user});
  Future<Either<Exception, UserEntiy>> getcashedUser();
}

class LocalAuthImp extends LocalAuth {
  SharedPreferences sharedPreferences;
  LocalAuthImp({required this.sharedPreferences});

  @override
  Future<Either<Exception, Unit>> cashUser({required UserEntiy user}) async {
    try {
      await sharedPreferences.setString(userKey, jsonEncode(user));
      return const Right(unit);
    } catch (error) {
      return Left(CashException());
    }
  }

  @override
  Future<Either<Exception, UserEntiy>> getcashedUser() async {
    try {
      String? user = sharedPreferences.getString(userKey);
      if (user != null) {
        return Right(jsonDecode(user));
      } else {
        return Left(CashException());
      }
    } catch (error) {
      return Left(CashException());
    }
  }
}
