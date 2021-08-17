import 'package:flutter/material.dart';

import '../models/todo.dart';
import '../models/status_enum.dart';

import '../widgets/todo_item.dart';

class TooDetailScreen extends StatelessWidget {
  // const TodoHomeScreen({Key? key}) : super(key: key);
  // final String title;

  // TooDetailScreen(this.title);
  static const routeName = '/todo-detail';

  @override
  Widget build(BuildContext context) {
    final todoId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
        appBar: AppBar(
          title: Text(todoId),
        ),
        body: Container(
          child: Text('Product Detail Screen'),
        ));
  }
}
