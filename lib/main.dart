// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_task/Core/BlocObserver/observer.dart';
import 'package:todo_task/Core/strings.dart';
import 'package:todo_task/Features/Authentication/Presentation/Widgets/Auth/login.dart';
import 'package:todo_task/Features/Todo/Presentation/Widgets/TodoUI/NoteScreen.dart';
import 'Core/app.dart';
import 'Core/depndancyinjection.dart' as db;

void main() async {
  await intialization();
  Bloc.observer = MyBlocObserver();

  runApp(MyApp(
    nextwidget: await check_next(),
  ));
}

Future<void> intialization() async {
  WidgetsFlutterBinding.ensureInitialized();
  await db.init();
}

// ignore: non_constant_identifier_names
Widget check_next() {
  final user = db.db<SharedPreferences>().getString(userKey);
  if (user == null) {
    return LoginPage();
  }
  return NoteScreen();
}
