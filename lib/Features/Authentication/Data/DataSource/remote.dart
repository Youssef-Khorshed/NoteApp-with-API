import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_task/Core/exception.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Authentication/Data/Model/usermodel.dart';

abstract class AuthRemote {
  Future<Either<Exception, UserModel>> login(
      {required String email, required String password});
}

class AuthRemoteImp extends AuthRemote {
  Dio dio;
  AuthRemoteImp({required this.dio});

  @override
  Future<Either<Exception, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final resopnse = await dio.post(loginUser,
          data: {
            "username": email // 9uQFF1Lh 9uQFF1Lh //'atuny0'
            ,
            "password": password
          },
          options: Options(headers: headers()));

      if (resopnse.statusCode == 200 || resopnse.data == null) {
        final res = UserModel.fromMap(resopnse.data);
        return Right(res);
      } else {
        print('=============respomse=================');
        print(resopnse.statusCode);
        return Left(AuthException());
      }
    } catch (error) {
      print('=============respomse=================');
      print(error);
      return Left(AuthException());
    }
  }
}
