import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/providers/todo.dart';

import './../providers/todos_provider.dart';
import './../models/status_enum.dart';

class TooDetailScreen extends StatelessWidget {
  // const TodoHomeScreen({Key? key}) : super(key: key);
  // final String title;

  // TooDetailScreen(this.title);
  static const routeName = '/todo-detail';

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;
    final todosData = Provider.of<ToDosProvider>(
      context,
      listen: false,
    );

    // final todo = Provider.of<ToDo>(
    //   context,
    //   listen: true,
    // );
    final todo = todosData.findById(itemId);
    print('Detail Screen re-rendered');
    return Scaffold(
        appBar: AppBar(
          title: Text(todo.id),
        ),
        body: Column(children: [
          Text(todo.title),
          Icon(todo.status == Status.pending ? Icons.pending : Icons.done),
          GestureDetector(
            child: Container(
              // Consmer used to optimize in a way that only some portion of the widget tree re-renders
              child: Consumer<ToDosProvider>(
                  builder: (_, foo, __) => Text(todo.statusString)),
              // child: Text(todo.statusString)),
              height: 50,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onTap: () => todosData.updateStatusById(itemId),
          ),
        ]));
  }
}
