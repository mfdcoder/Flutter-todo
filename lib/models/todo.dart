import 'status_enum.dart';

class ToDo {
  final String id;
  final String title;
  final String body;
  final DateTime deadline;
  final Status status;

  ToDo({
    required this.id,
    required this.title,
    required this.body,
    required this.deadline,
    this.status = Status.pending,
  });
}
