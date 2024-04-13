import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/Core/depndancyinjection.dart' as db;
import 'package:todo_task/Core/theme/theme_cubit.dart';
import 'package:todo_task/Features/Todo/Presentation/Logic/bloc/todo_bloc.dart';

import '../Features/Authentication/Presentation/Logic/bloc/auth_bloc.dart';

class MyApp extends StatelessWidget {
  Widget nextwidget;
  MyApp({required this.nextwidget});
  @override
  Widget build(BuildContext context) {
    final isPlatformDark =
        WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
    final initTheme =
        isPlatformDark ? ThemeCubit.lightTheme : ThemeCubit.darkTheme;
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => db.db<AuthBloc>(),
          ),
          BlocProvider(
            create: (context) => db.db<ThemeCubit>(),
          ),
          BlocProvider(
            create: (context) =>
                db.db<TodoBloc>()..add(GetTaskEvent(userid: '1')),
          ),
        ],
        child: BlocBuilder<ThemeCubit, bool>(builder: (context, state) {
          final bloc = context.watch<TodoBloc>();
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: initTheme,
            themeMode: state ? ThemeMode.light : ThemeMode.dark,
            darkTheme: ThemeCubit.darkTheme,
            home: nextwidget,
          );
        }));
  }
}
