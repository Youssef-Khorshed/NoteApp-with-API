// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/Core/ReuseableComponent/navigation.dart';
import 'package:todo_task/Features/Authentication/Presentation/Widgets/Auth/usernameFiled.dart';
import 'package:todo_task/Features/Authentication/Presentation/Widgets/Auth/passwordfiled.dart';
import 'package:todo_task/Features/Authentication/Presentation/Logic/bloc/auth_bloc.dart';
import 'package:todo_task/Features/Todo/Presentation/Widgets/TodoUI/NoteScreen.dart';
import '../../../../../../Core/ReuseableComponent/snackbar_message.dart';
import 'component.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final bloc = context.watch<AuthBloc>();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccrss) {
          SnackBarMessage.showSuccessSnackBar(
              message: 'Login Success', context: context);
          animated_navigation(context: context, widget: NoteScreen());
        }
        if (state is AuthFail) {
          SnackBarMessage.showErrorSnackBar(
              message: state.message, context: context);
        }
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: height / 10, left: 30),
            child: Text(
              'Note App',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: width / 3,
                      height: height / 3,
                    ),
                    UserNamedField(
                      controller: bloc.email_controller,
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    PasswordField(
                      controller: bloc.password_controller,
                    ),
                    SizedBox(
                      height: height / 10,
                    ),
                    bloc.state is AuthLoading
                        ? Text("Please wait....")
                        : submitButton(
                            formKey: _formKey,
                            bloc: bloc,
                            email: bloc.email_controller.text,
                            password: bloc.password_controller.text,
                            context: context),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
