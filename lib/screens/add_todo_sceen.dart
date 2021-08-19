import 'package:flutter/material.dart';

class AddToDoScreen extends StatefulWidget {
  static const routeName = '/add-todo';

  const AddToDoScreen({Key? key}) : super(key: key);

  @override
  _AddToDoScreenState createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('New ToDo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Title'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Description'),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
