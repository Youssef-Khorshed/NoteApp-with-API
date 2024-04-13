import 'package:flutter/material.dart';

class UserNamedField extends StatefulWidget {
  TextEditingController controller;
  UserNamedField({required this.controller});
  @override
  _UserNamedFieldState createState() => _UserNamedFieldState();
}

class _UserNamedFieldState extends State<UserNamedField> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: Colors.grey.shade300,
          filled: true,
          labelText: 'UserName',
        ),
        obscureText: _obscureText,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a Username';
          }

          return null;
        },
      ),
    );
  }
}
