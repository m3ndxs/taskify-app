import 'package:taskify_app/domain/models/enum/task_priority.dart';

class Task {
  final int? id;
  final String title;
  final String description;
  final DateTime createdAt;
  final TaskPriority taskPriority;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.taskPriority,
  });

  String get formattedDate {
    final day = createdAt.day.toString().padLeft(2, "0");
    final month = createdAt.month.toString().padLeft(2, "0");
    final year = createdAt.year;

    return "$day/$month/$year";
  }
}