import 'package:flutter/material.dart';

class PageControllerApp extends ChangeNotifier {
  int _index = 0;
  int _currentIndex = -1;
  bool _isFlipped = false;

  int get index => _index;
  int get currentIndex => _currentIndex;
  bool get isFlipped => _isFlipped;

  setPageIndex(int value) {
    _index = value;
    notifyListeners();
  }

  setCurrentIndex(int value) {
    _currentIndex = value;
    if (_currentIndex == -1) {
      _isFlipped = false;
    }
    notifyListeners();
  }

  setisFlipped(bool value) {
    _isFlipped = value;
    notifyListeners();
  }
}
