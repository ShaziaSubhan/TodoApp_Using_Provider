import 'package:flutter/material.dart';

import 'task_provider.dart';

class SaveTask extends ChangeNotifier{
  List<Task> _tasks = [
    // Task(title: 'learn flutter',isCompleted: false),
    // Task(title: 'Drink Water',isCompleted: false),
  ];
  List<Task> get tasks => _tasks;
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