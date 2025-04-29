import 'package:desafio_tecnico_flutter/viewmodels/tasks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'models/task_model.dart';
import 'views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskViewModel(),
      child: MaterialApp(
        title: 'Lista de Tarefas',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black, 
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurpleAccent, 
            foregroundColor: Colors.white, 
          ),
          textTheme: ThemeData.dark().textTheme.apply(
                bodyColor: Colors.white, 
                displayColor: Colors.white,
              ),
          checkboxTheme: CheckboxThemeData(
            fillColor: WidgetStateProperty.all(Colors.white), 
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
