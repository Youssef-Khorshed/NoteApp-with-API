import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/Core/ReuseableComponent/snackbar_message.dart';
import 'package:todo_task/Features/Todo/Presentation/Logic/bloc/todo_bloc.dart';
import 'package:todo_task/Features/Todo/Presentation/Widgets/TodoUI/addnote.dart';
import 'package:todo_task/Features/Todo/Presentation/Widgets/TodoUI/searchpage.dart';

class NoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = context.watch<TodoBloc>();

    return BlocListener<TodoBloc, TodoState>(
      listener: (context, state) {
        if (state is AddTodoFail) {
          SnackBarMessage.showSuccessSnackBar(
              message: 'No internet access', context: context);
        }
      },
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text('Notes'),
              floating: true,
              expandedHeight: 160.0,
              flexibleSpace: FlexibleSpaceBar(),
              actions: [
                TextButton(
                    onPressed: () {
                      bloc.add(GetTaskEvent(
                          userid: 'userid', limit: '10', skip: '10'));
                    },
                    child: Text('Filter')),
                // IconButton(
                //   icon: Icon(Icons.search),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(builder: (context) => Searchpage()),
                //     );

                //     // Handle search action
                //   },
                // ),
              ],
            ),
            NoteGrid(),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'add',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NoteAddForm()),
                );
              },
              tooltip: 'Add Task',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 20,
            ),
            // FloatingActionButton(
            //   heroTag: 'search',
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (context) => Searchpage()),
            //     );
            //   },
            //   tooltip: 'Add Task',
            //   child: Icon(Icons.search),
            // ),
          ],
        ),
      ),
    );
  }
}

class NoteGrid extends StatelessWidget {
  final List<Color> _randomColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  Color _getRandomColor() {
    final random = Random();
    return _randomColors[random.nextInt(_randomColors.length)];
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc bloc = context.watch<TodoBloc>();

    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        return SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                color: state is TodoLoading
                    ? Colors.grey.shade300
                    : _getRandomColor(),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      state is TodoLoading
                          ? ''
                          : 'Note ${bloc.todoEntity!.todos![index].todo}\n ${bloc.todoEntity!.todos![index].userId} ',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            },
            childCount: bloc.todoEntity == null
                ? 10
                : bloc.todoEntity!.todos!
                    .length, // Change this to the number of notes you want to display
          ),
        );
      },
    );
  }
}
