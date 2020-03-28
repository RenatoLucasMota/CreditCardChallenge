import 'package:flutter/material.dart';

class OffsetController extends ChangeNotifier {

  double _page = 0;
  double _offset = 0;

  double get page => _page;
  double get offset => _offset;

  OffsetController(PageController pageController){
    pageController.addListener((){
      _page = pageController.page;
      _offset = pageController.offset;
      notifyListeners();  
    });
  }
}