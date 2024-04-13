import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_task/Features/Todo/Presentation/Logic/bloc/todo_bloc.dart';
import 'package:todo_task/Features/Todo/Presentation/Widgets/TodoUI/searchitem.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<TodoBloc>();
    final blocstate = context.watch<TodoBloc>().state;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SearchWidget(
                text: '',
                onChanged: (String query) {
                  bloc.add(SearchData(query: query));
                },
                hintText: 'Search'),
            blocstate is TodoLoading
                ? Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 3),
                    child: const CircularProgressIndicator(),
                  )
                : bloc.todoEntity == null
                    ? const Text('item not found')
                    : Expanded(
                        child: ListView.separated(
                          itemBuilder: ((context, index) => ListTile(
                                title: Text(
                                    '${bloc.todoEntity!.todos![index].todo}'),
                              )),
                          itemCount: bloc.todoEntity!.todos!.length,
                          separatorBuilder: (context, index) => Divider(),
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
