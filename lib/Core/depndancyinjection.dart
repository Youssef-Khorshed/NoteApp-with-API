import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/Core/app.dart';
import 'package:todo_task/Core/internet.dart';
import 'package:todo_task/Core/theme/theme_cubit.dart';
import 'package:todo_task/Features/Authentication/Data/DataSource/local.dart';
import 'package:todo_task/Features/Authentication/Data/DataSource/remote.dart';
import 'package:todo_task/Features/Authentication/Data/repoImplement/repo.dart';
import 'package:todo_task/Features/Authentication/Domain/UseCases/login.dart';
import 'package:todo_task/Features/Authentication/Domain/repo/repo.dart';
import 'package:todo_task/Features/Todo/Data/DataSource/local.dart';
import 'package:todo_task/Features/Todo/Data/DataSource/remote.dart';
import 'package:todo_task/Features/Todo/Data/repoImplement/repo.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/addTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/deleteTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/getTask.dart';
import 'package:todo_task/Features/Todo/Domain/UseCases/updateTask.dart';
import 'package:todo_task/Features/Todo/Domain/repo/repo.dart';
import 'package:todo_task/Features/Todo/Presentation/Logic/bloc/todo_bloc.dart';
import '../Features/Authentication/Presentation/Logic/bloc/auth_bloc.dart';

final db = GetIt.instance;

Future<void> init() async {
  // theme Bloc
  db.registerFactory(() => ThemeCubit());
  // Auth Bloc
  db.registerFactory(() => AuthBloc(
        loginUseCase: db(),
      ));

  db.registerFactory(() => TodoBloc(
        addTaskUseCase: db(),
        updateTaskUseCase: db(),
        deleteTaskUseCase: db(),
        getTaskUseCase: db(),
      ));

  // UseCases
  db.registerLazySingleton(() => LoginUseCase(repo: db()));
  db.registerLazySingleton(() => AddTaskUseCase(repo: db()));
  db.registerLazySingleton(() => DeleteTaskUseCase(repo: db()));
  db.registerLazySingleton(() => UpateTasksUseCase(repo: db()));
  db.registerLazySingleton(() => GetTasksUseCase(repo: db()));

  db.registerLazySingleton<AuthRepo>(
      () => AuthRepoImp(localAuth: db(), networkInfo: db(), remote: db()));
  db.registerLazySingleton<TodoRepo>(
      () => TodoRepoImp(localTodo: db(), networkInfo: db(), remote: db()));

  // Network
  db.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(db()));

  //DataSource
  db.registerLazySingleton<LocalAuth>(
      () => LocalAuthImp(sharedPreferences: db()));
  db.registerLazySingleton<AuthRemote>(() => AuthRemoteImp(dio: db()));

  db.registerLazySingleton<LocalTodo>(
      () => LocalTodoImp(sharedPreferences: db()));
  db.registerLazySingleton<RemoteTodo>(() => RemoteTodoImp(dio: db()));

  //objects
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio(BaseOptions());

  db.registerLazySingleton(() => sharedPreferences);
  db.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());
  db.registerLazySingleton(() => dio);
  db.registerLazySingleton(() => Widget);
  db.registerLazySingleton(() => MyApp(
        nextwidget: db(),
      ));
}
