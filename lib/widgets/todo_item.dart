import 'package:flutter/material.dart';
import '../models/todo.dart';

import './../screens/todo_detail_screen.dart';

class ToDoItem extends StatelessWidget {
  final ToDo item;

  ToDoItem(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.body),
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (ctx) => TooDetailScreen(item.title)));
        Navigator.of(context)
            .pushNamed(TooDetailScreen.routeName, arguments: item.id);
      },
    );
  }
}
