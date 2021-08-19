import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './todo_item.dart';
import './../providers/todos_provider.dart';
import './../providers/todo.dart';

class ToDoListView extends StatelessWidget {
  var _tabIndex = 0;

  ToDoListView(this._tabIndex);

  @override
  Widget build(BuildContext context) {
    final todosData = Provider.of<ToDosProvider>(context);
    // final todos = todosData.findByStatus(_tabIndex);
    var todos = <ToDo>[];
    if (_tabIndex == 0) {
      todos = todosData.items;
    } else if (_tabIndex == 1) {
      todos = todosData.completedItems;
    } else {
      todos = todosData.pendingItems;
    }

    return ListView.builder(
      itemCount: todos.length,
      // itemBuilder: (context, index) {
      //   return ChangeNotifierProvider(
      //     create: (c) => todos[index],
      //     child: ToDoItem(),
      //   );
      // },
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: todos[index],
          child: ToDoItem(),
        );
      },
    );
  }
}
