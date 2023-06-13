import 'dart:convert';

import 'package:flutter/material.dart';
enum Status { card }
class MyHomeProvider extends ChangeNotifier {
  int _currentIndex = 0;

  get getIndex => _currentIndex;

  set setIndex(value){
    _currentIndex = value;
    notifyListeners();
  }
  
  final List<Map<String, dynamic>> _carouselItems = [
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful store',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    {
      'image': 'assets/images/toko1.png',
      'caption': 'Beautiful Landscape',
    },
    
  ];
  List<Map<String, dynamic>> get carouselItem => _carouselItems;

  
  final _jsonData = {
    "data": [
      {
        "name": "Produk 1",
        'image': 'assets/images/toko1.png',
      },
      {
        "name": "Produk 1",
        'image': 'assets/images/toko1.png',
        
      },
      {
        "name": "Produk 1",
        'image': 'assets/images/toko1.png',
        
      },
      {
        "name": "Produk 1",
        'image': 'assets/images/toko1.png',
        
      },
    ]
  };


  

  get jsonData {
    var tmp = json.encode(_jsonData);
    return json.decode(tmp);
    
  }
  Status _status = Status.card;

  get status => _status;
  set status(value) {
    _status = value;
    notifyListeners();
  }
}


