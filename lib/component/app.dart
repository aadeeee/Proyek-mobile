import 'package:flutter/material.dart';
import 'package:mobile/component/Pelanggan.dart';
import 'package:mobile/component/daftar.dart';
import 'package:mobile/component/home_.dart';
import 'package:mobile/component/produk.dart';
import 'package:mobile/component/profil.dart';
import 'package:mobile/component/transaksi.dart';

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    MyHome(),
    MyTransaction(),
    MyProduct(),
    MyCustomer(),
    MyProfil()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.purple,
        selectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap:(index){
          setState(() {
          _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Beranda',
          backgroundColor: Colors.purple[700]),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Transaksi',
           backgroundColor: Colors.purple[700]),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro,
            ),
          label: 'Produk',
           backgroundColor: Colors.purple[700]),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Pelanggan',
           backgroundColor: Colors.purple[700]),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          label: 'Profil',
           backgroundColor: Colors.purple[700])
        ]),
    );
  }
}