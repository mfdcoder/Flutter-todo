import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './todo_item.dart';
import './../providers/todos_provider.dart';

class ToDoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosData = Provider.of<ToDosProvider>(context);
    final todos = todosData.items;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider(
          create: (c) => todos[index],
          child: ToDoItem(),
        );
      },
    );
  }
}
