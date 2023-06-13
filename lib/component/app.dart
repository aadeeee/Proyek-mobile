import 'package:flutter/material.dart';
import 'package:mobile/component/Pelanggan.dart';
import 'package:mobile/component/home.dart';
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
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffFD61876E),
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
          backgroundColor: Color(0xffFD61876E)),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Transaksi',
           backgroundColor: Color(0xffFD61876E)),
          BottomNavigationBarItem(
            icon: Icon(Icons.euro,
            ),
          label: 'Produk',
           backgroundColor: Color(0xffFD61876E)),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
          label: 'Pelanggan',
           backgroundColor: Color(0xffFD61876E)),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
          label: 'Profil',
           backgroundColor: Color(0xffFD61876E))
        ]),
    );
  }
}