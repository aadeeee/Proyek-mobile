import 'package:flutter/material.dart';

class MyHomeProvider extends ChangeNotifier {
  int _currentIndex = 0;

  get getIndex => _currentIndex;

  set setIndex(value){
    _currentIndex = value;
    notifyListeners();
  }
  
}
