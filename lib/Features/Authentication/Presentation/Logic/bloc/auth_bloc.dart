// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_task/Core/getFailure.dart';
import 'package:todo_task/Features/Authentication/Domain/Entity/user.dart';
import 'package:todo_task/Features/Authentication/Domain/UseCases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  LoginUseCase loginUseCase;
  bool change = true;
  TextEditingController email_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController signup_email = TextEditingController();
  TextEditingController signup_username = TextEditingController();
  TextEditingController signup_password = TextEditingController();
  TextEditingController signup_phone = TextEditingController();
  UserEntiy? userentity;
  AuthBloc({
    required this.loginUseCase,
  }) : super(AuthInitial()) {
    on<AuthEvent>;
    on<LoginEvent>(login);
  }
  FutureOr<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading(change: change));
    final value =
        await loginUseCase.call(email: event.email, password: event.password);
    cleartext();
    change = false;

    value.fold((fail) {
      change = true;
      emit(AuthFail(message: getfailure(failure: fail), change: change));
    }, (entity) {
      userentity = entity;
      change = true;
      emit(AuthSuccrss(entiy: entity, change: change));
    });
  }

  void cleartext() {
    email_controller.clear();
    password_controller.clear();
    signup_email.clear();
    signup_username.clear();
    signup_password.clear();
    signup_phone.clear();
  }
}
