import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/Core/ReuseableComponent/snackbar_message.dart';
import 'package:todo_task/Core/depndancyinjection.dart' as db;
import 'package:todo_task/Features/Todo/Presentation/Logic/bloc/todo_bloc.dart';

class NoteAddForm extends StatefulWidget {
  @override
  _NoteAddFormState createState() => _NoteAddFormState();
}

class _NoteAddFormState extends State<NoteAddForm> {
  Color _selectedColor = Colors.white;
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  void _selectColor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    //  final todo_bloc = db.db<TodoBloc>();
    final todo_bloc = context.watch<TodoBloc>();

    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is TodoSuccrss) {
          SnackBarMessage.showSuccessSnackBar(
              message: 'Add Task Completed', context: context);
        }
        if (state is AddTodoFail) {
          SnackBarMessage.showErrorSnackBar(
              message: state.message, context: context);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.purple.shade700,
            child: ElevatedButton(
                onPressed: () {
                  todo_bloc.add(AddTaskEvent(
                      userid: '1', task: todo_bloc.search_controller.text));
                },
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                )),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: todo_bloc.search_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Note',
                ),
                maxLines: 1,
              ),
              SizedBox(height: 20.0),
              Row(
                children: <Widget>[
                  Text('Date:'),
                  SizedBox(width: 10.0),
                  TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text('Color:'),
              SizedBox(height: 10.0),
              Row(
                children: <Widget>[
                  _buildColorButton(Colors.white),
                  SizedBox(width: 5.0),
                  _buildColorButton(Colors.blue),
                  SizedBox(width: 5.0),
                  _buildColorButton(Colors.green),
                  SizedBox(width: 5.0),
                  _buildColorButton(Colors.yellow),
                  SizedBox(width: 5.0),
                  _buildColorButton(Colors.red),
                ],
              ),
              SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return GestureDetector(
      onTap: () => _selectColor(color),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: color == _selectedColor ? Colors.black : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
