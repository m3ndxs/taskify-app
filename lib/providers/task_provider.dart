import 'package:flutter/material.dart';
import 'package:taskify_app/domain/models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  //Adicionar task
  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  //Remover task
  void removeTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  // Concluir task
  void toggleTask(String id) {
    final task = _tasks.firstWhere((task) => task.id == id);
    task.isDone = !task.isDone;
    notifyListeners();
  }
}