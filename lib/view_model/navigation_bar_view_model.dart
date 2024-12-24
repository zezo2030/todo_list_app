import 'package:flutter/material.dart';

class NavigationBarViewModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeTap(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}