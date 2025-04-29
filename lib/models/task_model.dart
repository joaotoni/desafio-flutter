import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  bool isDone;

  @HiveField(3) 
  String status;

  TaskModel({
    required this.id,
    required this.title,
    this.isDone = false,
    this.status = 'Pendente',
  });
}
