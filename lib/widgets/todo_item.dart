import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/todo.dart';

import './../screens/todo_detail_screen.dart';
import './../providers/todo.dart';
import './../models/status_enum.dart';

class ToDoItem extends StatelessWidget {
  // final ToDo item;

  // ToDoItem(this.item);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ToDo>(context, listen: true);
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.body),
      leading: Icon(item.status == Status.pending ? Icons.pending : Icons.done),
      trailing: GestureDetector(
        child: Container(
          child: Text(item.statusString),
          height: 30,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () => item.updateStaus(),
      ),
      onTap: () {
        // Navigator.of(context).push(
        //     MaterialPageRoute(builder: (ctx) => TooDetailScreen(item.title)));
        Navigator.of(context)
            .pushNamed(TooDetailScreen.routeName, arguments: item.id);
      },
    );
  }
}
