import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/domain/models/enum/task_priority.dart';
import 'package:taskify_app/domain/models/task.dart';
import 'package:taskify_app/providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  Color getPriorityColor(TaskPriority taskPriority) {
    switch (taskPriority) {
      case TaskPriority.alta:
        return Colors.red;
      case TaskPriority.media:
        return Colors.orange;
      case TaskPriority.baixa:
        return Colors.green;
    }
  }

  String getPriorityText(TaskPriority taskPriority) {
    switch (taskPriority) {
      case TaskPriority.alta:
        return "ALTA";
      case TaskPriority.media:
        return "MÉDIA";
      case TaskPriority.baixa:
        return "BAIXA";
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<TaskProvider>();

    return SizedBox(
      child: Stack(
        children: [
          Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Checkbox(
                    value: task.isDone,
                    onChanged: (_) {
                      provider.toggleTask(task.id!);
                    },
                  ),
                  Icon(
                    Icons.task_outlined,
                    size: 56,
                    color: const Color(0xFFB6FF02),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.title,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                                decoration: task.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          task.description,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        Text(
                          task.formattedDate,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      provider.removeTask(task.id!);
                    },
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 16,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: getPriorityColor(task.taskPriority),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                getPriorityText(task.taskPriority),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
