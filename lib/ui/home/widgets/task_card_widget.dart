import 'package:flutter/material.dart';
import 'package:taskify_app/domain/models/enum/task_priority.dart';
import 'package:taskify_app/domain/models/task.dart';

class TaskCard extends StatelessWidget {
  // final Task task;
  // final VoidCallback onEdit;
  // final VoidCallback onDelete;

  const TaskCard({
    super.key,
    // required this.task,
    // required this.onEdit,
    // required this.onDelete,
  });

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
    return SizedBox(
      height: 130,
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
                          "Titulo task",
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Descrição da tarefa que deve ser feita hoje",
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurface.withValues(alpha: 0.6),
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 3),
                        Text(
                          "Aqui vem a data de criação da task",
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
                ],
              ),
            ),
          ),

          Positioned(
            top: 24,
            right: 16,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              decoration: BoxDecoration(
                color: getPriorityColor(TaskPriority.alta),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                getPriorityText(TaskPriority.alta),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
