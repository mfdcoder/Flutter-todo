import 'package:flutter/material.dart';

import './../widgets/todo_listview.dart';

class TodoHomeScreen extends StatelessWidget {
  // const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo\'s'),
      ),
      body: ToDoListView(),
    );
  }
}
