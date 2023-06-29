import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/component/Produk/produkBeli.dart';
import 'package:mobile/component/Produk/produkfab.dart';

import '../../Variabel/global.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Produk',
            style: GoogleFonts.inter(fontWeight: FontWeight.w600, fontSize: 20)
            ),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(text: 'Penjualan',),
            Tab(text: 'Pembelian'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: MyProductList(),
          ),
          Center(
            child: MyProductListBeli(),
          ),
        ],
      ),
    );
  }
}
