import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/model/task.dart';

class TaskViewModel extends ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  // load data from local storage
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? taskData = prefs.getString('tasks');

    if (taskData != null) {
      final List<dynamic> jsonList = jsonDecode(taskData);
      _tasks.addAll(jsonList.map((data) => Task.fromJason(data)).toList());
      notifyListeners();
    }
  }

  // save data to local storage
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonList =
        jsonEncode(_tasks.map((task) => task.toJson()).toList());
    prefs.setString('tasks', jsonList);
  }

  // add a new task
  void addTask(String title) {
    _tasks.add(Task(title: title));
    saveTasks();
    notifyListeners();
  }

  // switch of don or not don
  void togleTask(int index) {
    _tasks[index].isDone = !_tasks[index].isDone;
    saveTasks();
    notifyListeners();
  }

  // delet tasks
  void deleteTask(int index) {
    _tasks.removeAt(index);
    saveTasks();
    notifyListeners();
  }
}
