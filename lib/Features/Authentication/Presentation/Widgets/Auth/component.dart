// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:todo_task/Core/colors.dart';
import 'package:todo_task/Features/Authentication/Presentation/Logic/bloc/auth_bloc.dart';
import '../../../../../../Core/ReuseableComponent/snackbar_message.dart';

Widget entryField(String title,
    {bool isPassword = false,
    bool isvalid = true,
    required TextEditingController controller,
    String? hint}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        SizedBox(
          height: 10,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          child: TextFormField(
              controller: controller,
              keyboardType: TextInputType.text,
              validator: isvalid ? validation() : null,
              obscureText: isPassword,
              decoration: InputDecoration(
                  hintText: hint,
                  border: InputBorder.none,
                  fillColor: Colors.grey.shade300,
                  filled: true)),
        )
      ],
    ),
  );
}

String? Function(String?)? validation() {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
  };
}

Widget divider() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        Text('or'),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Divider(
              thickness: 1,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
      ],
    ),
  );
}

Widget submitButton({
  required AuthBloc bloc,
  required String email,
  required String password,
  required BuildContext context,
  required GlobalKey<FormState> formKey,
}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.symmetric(vertical: 15),
    alignment: Alignment.center,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.shade200,
              offset: Offset(2, 4),
              blurRadius: 5,
              spreadRadius: 2)
        ],
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: const [color11, color4])),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0, backgroundColor: Colors.transparent),
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            if (await InternetConnectionChecker().hasConnection) {
              print(email.compareTo('atuny0')); //9uQFF1Lh
              print(password.compareTo('9uQFF1Lh')); //9uQFF1Lh
              print(password);
              bloc.add(LoginEvent(email: email, password: '9uQFF1Lh'));
            } else {
              // ignore: use_build_context_synchronously
              SnackBarMessage.showErrorSnackBar(
                  message:
                      // ignore: use_build_context_synchronously
                      "No internet connection",
                  // ignore: use_build_context_synchronously
                  context: context);
            }
          }
        },
        child: Text(
          "Login",
          style: TextStyle(fontSize: 20, color: Colors.white),
        )),
  );
}

Widget createAccountLabel(
    {required BuildContext context,
    required String text,
    required Widget page}) {
  return InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    },
    child: Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.all(15),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Don\'t have an account ?',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
                color: color3, fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}

Widget emailPasswordWidgetLogin(
    {required TextEditingController controllerEmail,
    controllerPassword,
    required BuildContext context}) {
  return Column(
    children: <Widget>[
      entryField("Username", controller: controllerEmail),
      entryField("Password", isPassword: true, controller: controllerPassword),
    ],
  );
}
