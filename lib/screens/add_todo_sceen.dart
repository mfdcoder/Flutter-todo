import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './../providers/todo.dart';
import './../providers/todos_provider.dart';

class AddToDoScreen extends StatefulWidget {
  static const routeName = '/add-todo';

  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  _AddToDoScreenState createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  final _formkey = GlobalKey<FormState>();

  var newToDo = ToDo(
    id: DateTime.now().toString(),
    title: 'title',
    body: 'body',
    deadline: DateTime.now(),
  );

  _onSubmit() {
    print('Submitted');
    final isValid = _formkey.currentState?.validate();
    if (isValid != null && !isValid) {
      return;
    }
    _formkey.currentState?.save();
    print(newToDo.title + ' ' + newToDo.body);
    final toDoData = Provider.of<ToDosProvider>(context, listen: false);
    toDoData.addToDo(newToDo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New ToDo'),
          actions: [
            IconButton(
              onPressed: () => {_onSubmit()},
              icon: Icon(Icons.save),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    onSaved: (newValue) {
                      newToDo = ToDo(
                        id: newToDo.id,
                        title: newValue as String,
                        body: newToDo.body,
                        deadline: newToDo.deadline,
                      );
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Title cannot be empty';
                      } else if (value != null && value.length < 2) {
                        return 'Min length must be 2';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    maxLines: 3,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.multiline,
                    onFieldSubmitted: (_) => {_onSubmit()},
                    onSaved: (newValue) {
                      newToDo = ToDo(
                        id: newToDo.id,
                        title: newToDo.title,
                        body: newValue as String,
                        deadline: newToDo.deadline,
                      );
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Description cannot be empty';
                      } else if (value != null && value.length < 2) {
                        return 'Min length must be 2';
                      }
                      return null;
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
