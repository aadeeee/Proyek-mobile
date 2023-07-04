import 'package:flutter/material.dart';
import 'package:mobile/Variabel/global.dart';
import 'package:mobile/component/Pelanggan/pelanggan.dart';
import 'package:mobile/component/home.dart';
import 'package:mobile/component/Profil/profil.dart';
import 'package:mobile/component/Transaksi/transaksi.dart';
import 'package:mobile/component/Produk/produk.dart';

class MyMain extends StatefulWidget {
  const MyMain({super.key});

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _currentIndex = 0;
  final List<Widget> pages = [
    const MyHome(),
    const TransactionPage(),
    const MyProduct(),
    const MyCustomer(),
    const MyProfil()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: primaryColor,
          selectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/beranda.png')),
                label: 'Beranda',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/transaksi.png')),
                label: 'Transaksi',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/produk.png')),
                label: 'Produk',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/pelanggan.png')),
                label: 'Pelanggan',
                backgroundColor: primaryColor),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage('assets/images/user.png')),
                label: 'Profil',
                backgroundColor: primaryColor)
          ]),
    );
  }
}
