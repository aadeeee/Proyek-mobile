import 'dart:convert';

import 'package:flutter/material.dart';

enum Status { card }

class MyHomeProvider extends ChangeNotifier {
  int _currentIndex = 0;

  get getIndex => _currentIndex;

  set setIndex(value) {
    _currentIndex = value;
    notifyListeners();
  }

  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Produk Baru ',
    },
    {
      'image': 'assets/images/toko2.png',
      'caption': '',
    },
    {
      'image': 'assets/images/toko3.png',
      'caption': '',
    },
    {
      'image': 'assets/images/toko4.png',
      'caption': '',
    },
    {
      'image': 'assets/images/toko5.png',
      'caption': '',
    },
  ];
  List<Map<String, dynamic>> get carouselItem => _carouselItems;
}
