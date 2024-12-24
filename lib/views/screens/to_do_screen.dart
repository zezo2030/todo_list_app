import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_model/navigation_bar_view_model.dart';
import 'package:todo_list_app/view_model/task_view_model.dart'; // لإدارة الحالة

class ToDoListScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  ToDoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskViewModel = Provider.of<TaskViewModel>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // حقل إدخال وإضافة مهمة
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Add a new task',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    if (_taskController.text.isNotEmpty) {
                      taskViewModel.addTask(_taskController.text);
                      _taskController.clear();
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            // عرض قائمة المهام
            Expanded(
              child: taskViewModel.tasks.isEmpty
                  ? const Center(
                      child: Text('No tasks available! Add a new one.'),
                    )
                  : ListView.builder(
                      itemCount: taskViewModel.tasks.length,
                      itemBuilder: (context, index) {
                        final task = taskViewModel.tasks[index];
                        return ListTile(
                          title: Text(
                            task.title,
                            style: TextStyle(
                              decoration: task.isDone
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                            ),
                          ),
                          leading: Checkbox(
                            value: task.isDone,
                            onChanged: (_) {
                              taskViewModel.togleTask(index);
                            },
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              taskViewModel.deleteTask(index);
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
