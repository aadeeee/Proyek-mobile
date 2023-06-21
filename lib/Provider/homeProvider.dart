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

  
  final _jsonData = {
    "data": [
      {
        "name": "Sapu",
        'image': 'assets/images/sapu.png',
      },
      {
        "name": "Botol Minum",
        'image': 'assets/images/botol-minum.png',
        
      },
      {
        "name": "Kipas",
        'image': 'assets/images/kipas.png',
        
      },
      {
        "name": "Meja",
        'image': 'assets/images/meja.png',
        
      },
    ]
  };


  

  get jsonData {
    var tmp = json.encode(_jsonData);
    return json.decode(tmp);
    
  }


  List _pelanggan = [
    {
      'nama': 'Yudi',
      'hp':'0852-5141-9882'
    },
    {
      'nama': 'Dila',
      'hp':'0823-7827-9829'
    }
  ];
  
  List get dataPelanggan => _pelanggan;
}


