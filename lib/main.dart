import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_using_provider/provider/save_task_provider.dart';

import 'screens/add_todo.dart';
import 'screens/todo_list.dart';

void main() {
  runApp(
    ChangeNotifierProvider (
    create: (context) => SaveTask(),
    
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    
     
      theme: ThemeData(
       brightness: Brightness.dark,
      ),
      initialRoute: '/',
      routes: {
        '/':(_) => const TodoList(),
        '/add-todo-screen': (_) => AddTodo(),

      },
     
    );
  }
}
