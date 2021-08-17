import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../models/status_enum.dart';

import '../widgets/todo_item.dart';

class TodoHomeScreen extends StatelessWidget {
  // const TodoHomeScreen({Key? key}) : super(key: key);

  final List<ToDo> todos = [
    ToDo(
      id: '1',
      title: 'Task-1',
      body: 'Body for task-11',
      deadline: DateTime.now(),
      status: Status.pending,
    ),
    ToDo(
      id: '2',
      title: 'Task-2',
      body: 'Body for task-2',
      deadline: DateTime.now(),
      status: Status.pending,
    ),
    ToDo(
      id: '3',
      title: 'Task-3',
      body: 'Body for task-3',
      deadline: DateTime.now(),
      status: Status.pending,
    ),
    ToDo(
      id: '4',
      title: 'Task-4',
      body: 'Body for task-4',
      deadline: DateTime.now(),
      status: Status.pending,
    ),
    ToDo(
      id: '5',
      title: 'Task-5',
      body: 'Body for task-5',
      deadline: DateTime.now(),
      status: Status.pending,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo\'s'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ToDoItem(todos[index]);
        },
      ),
    );
  }
}
