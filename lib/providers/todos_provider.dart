import 'package:flutter/material.dart';

import 'todo.dart';
import './../models/status_enum.dart';

class ToDosProvider with ChangeNotifier {
  List<ToDo> _todos = [
    ToDo(
      id: '1',
      title: 'Task-1',
      body: 'Body for task-11',
      deadline: DateTime.now(),
      status: Status.completed,
    ),
    ToDo(
      id: '2',
      title: 'Task-2',
      body: 'Body for task-2',
      deadline: DateTime.now(),
      status: Status.completed,
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

  List<ToDo> get items {
    return [..._todos]; // Return deep copy
  }

  List<ToDo> get completedItems {
    return [..._todos.where((element) => element.status == Status.completed)];
  }

  List<ToDo> get pendingItems {
    return [..._todos.where((element) => element.status == Status.pending)];
  }

  List<ToDo> findByStatus(int status) {
    if (status == 1) {
      return [..._todos.where((element) => element.status == Status.completed)];
    } else if (status == 2) {
      return [..._todos.where((element) => element.status == Status.pending)];
    }
    // Return deep copy
    return [..._todos];
    // notifyListeners()
  }

  ToDo findById(id) {
    return _todos.firstWhere((element) => element.id == id);
  }

  void updateStatusById(id) {
    final selectedItem = _todos.firstWhere((element) => element.id == id);
    if (selectedItem.status == Status.pending) {
      selectedItem.status = Status.completed;
    } else {
      selectedItem.status = Status.pending;
    }

    notifyListeners();
  }
}
