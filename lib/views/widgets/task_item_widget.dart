import 'package:desafio_tecnico_flutter/viewmodels/tasks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/task_model.dart';

class TaskItemWidget extends StatelessWidget {
  final TaskModel task;

  const TaskItemWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context, listen: false);

    return Dismissible(
      key: Key(task.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        taskViewModel.removeTask(task.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Tarefa "${task.title}" removida')),
        );
      },
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            color: task.isDone ? Colors.green : Colors.white,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green, 
            decorationThickness: 2, 
          ),
        ),
        leading: Checkbox(
          value: task.isDone,
          onChanged: (_) {
            taskViewModel.toggleTaskStatus(task.id);
          },
          activeColor: Colors.green, 
          checkColor: Colors.white,
        ),
      ),
    );
  }
}
