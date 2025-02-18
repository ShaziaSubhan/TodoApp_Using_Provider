import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/task_modal.dart';

class SaveTask extends ChangeNotifier{
  List<Task> _tasks = [
    // Task(title: 'Reading',isCompleted: false),
    // Task(title: 'Drink Water',isCompleted: false),
  ];
  List<Task> get tasks => _tasks;

   SaveTask() {
    loadTasks(); 
  }

 
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');

    if (tasksJson != null) {
      final List<dynamic> decodedTasks = jsonDecode(tasksJson);
      _tasks = decodedTasks.map((taskJson) => Task.fromJson(taskJson)).toList();
      notifyListeners();
    }
  }

 
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> tasksJson = _tasks.map((task) => task.toJson()).toList();
    prefs.setString('tasks', jsonEncode(tasksJson)); 
  }

  

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }
    void removeTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }


   void checkTask(int index){
    tasks[index].isDone();
    notifyListeners();
   }
}