import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskViewModel extends ChangeNotifier {
  final Box<TaskModel> _taskBox = Hive.box<TaskModel>('tasks');

  List<TaskModel> get tasks => _taskBox.values.toList();

  void addTask(String title) {
    final newTask = TaskModel(id: DateTime.now().toString(), title: title);
    _taskBox.add(newTask);
    notifyListeners();
  }

  void toggleTaskStatus(String id) {
    final task = _taskBox.values.firstWhere((task) => task.id == id);
    final taskKey = task.key;
    task.isDone = !task.isDone;
    task.status = task.isDone ? 'Concluído' : 'Pendente';
    _taskBox.put(taskKey, task);
    notifyListeners();
  }

  void removeTask(String id) {
    final task = _taskBox.values.firstWhere((task) => task.id == id);
    final taskKey = task.key;
    _taskBox.delete(taskKey);
    notifyListeners();
  }
}
