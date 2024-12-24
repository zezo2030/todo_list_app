import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/view_model/navigation_bar_view_model.dart';
import 'package:todo_list_app/views/screens/to_do_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final navigationViewmodel = Provider.of<NavigationBarViewModel>(context);

    // screen navigation
    final screens = [
      ToDoListScreen(),
      Text("Screen 2"),
      Text("Screen 3"),
    ];


    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: screens[navigationViewmodel.currentIndex],
      bottomNavigationBar: BottomNavyBar(
        showElevation: true,
        selectedIndex: navigationViewmodel.currentIndex,
        onItemSelected: (index){
           navigationViewmodel.changeTap(index);
         },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Tasks'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.add),
              title: Text('Add Task'),
              activeColor: Colors.purpleAccent
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.message),
              title: Text('Messages'),
              activeColor: Colors.pink
          ),

        ],

      )
      // BottomNavigationBar(
      //   currentIndex: navigationViewmodel.currentIndex,
      //     onTap: (index){
      //       navigationViewmodel.changeTap(index);
      //     },
      //     selectedItemColor: Colors.blue,
      //     unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: 'Tasks',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.bar_chart),
      //       label: 'Statistics',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
