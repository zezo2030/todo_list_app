import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_model/navigation_bar_view_model.dart';
import 'package:todo_list_app/view_model/task_view_model.dart';
import 'package:todo_list_app/views/screens/home_screen.dart';
import 'package:todo_list_app/views/screens/to_do_screen.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskViewModel()..loadTasks()),
        ChangeNotifierProvider(create: (_) => NavigationBarViewModel()),
      ],
      child: MaterialApp(
        title: "Todo App",
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: HomeScreen(),
      ),
    );
  }
}
