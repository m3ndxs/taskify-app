import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskify_app/providers/task_provider.dart';
import 'package:taskify_app/ui/home/widgets/task_card_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final tasks = context.watch<TaskProvider>().tasks;

    if (tasks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(child: Image.asset("assets/images/tasklist.png")),
            Text(
              "Registre suas tarefas!",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];

        return TaskCard(task: task);
      },
    );
  }
}
