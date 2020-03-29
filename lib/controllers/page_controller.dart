import 'package:flutter/material.dart';

class PageControllerApp extends ChangeNotifier {
  int _index = 0;
  int _currentIndex = -1;

  int get index => _index;
  int get currentIndex => _currentIndex;

  setPageIndex(int value){
    _index = value;
    notifyListeners(); 
  }

  setCurrentIndex(int value){
    _currentIndex = value;
    notifyListeners(); 
  }
}
