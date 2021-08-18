import 'package:flutter/material.dart';

import '../models/status_enum.dart';

class ToDo with ChangeNotifier {
  final String id;
  final String title;
  final String body;
  final DateTime deadline;
  Status status;

  ToDo({
    required this.id,
    required this.title,
    required this.body,
    required this.deadline,
    this.status = Status.pending,
  });

  String get statusString {
    switch (status) {
      case Status.pending:
        return 'Pending';
      case Status.completed:
        return 'Completed';
      case Status.overdue:
        return 'Overdue';
      default:
        return '';
    }
  }

  void updateStaus() {
    print(id + ' - Old Status ' + status.toString());
    if (status == Status.completed) {
      status = Status.pending;
    } else {
      status = Status.completed;
    }
    print('New Status ' + status.toString());
    notifyListeners();
  }
}
