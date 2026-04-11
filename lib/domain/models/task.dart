import 'package:taskify_app/domain/models/enum/task_priority.dart';

class Task {
  final String? id;
  final String title;
  final String description;
  final DateTime createdAt;
  final TaskPriority taskPriority;
  bool isDone;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.taskPriority,
    this.isDone = false,
  });

  String get formattedDate {
    final day = createdAt.day.toString().padLeft(2, "0");
    final month = createdAt.month.toString().padLeft(2, "0");
    final year = createdAt.year;

    return "$day/$month/$year";
  }
}