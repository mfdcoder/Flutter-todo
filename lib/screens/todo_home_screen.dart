import 'package:flutter/material.dart';
import '../screens/add_todo_sceen.dart';

import './../widgets/todo_listview.dart';

class TodoHomeScreen extends StatefulWidget {
  // const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  _TodoHomeScreenState createState() => _TodoHomeScreenState();
}

class _TodoHomeScreenState extends State<TodoHomeScreen> {
  int _tabIndex = 0;

  void _selectTab(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo\'s'),
        actions: [
          IconButton(
            onPressed: () =>
                {Navigator.of(context).pushNamed(AddToDoScreen.routeName)},
            icon: Icon(Icons.add),
          )
        ],
      ),
      // body: _tabs[_tabIndex],
      body: ToDoListView(_tabIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive),
            label: 'All',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Done',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pending),
            label: 'Pending',
          ),
        ],
        currentIndex: _tabIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _selectTab,
      ),
    );
  }
}
