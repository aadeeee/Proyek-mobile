import 'package:flutter/material.dart';
import 'package:mobile/component/produkfab.dart';

class MyProduct extends StatefulWidget {
  @override
  _MyProductState createState() => _MyProductState();
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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFD61876E),
        title: Text('Produk',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )),
        bottom: TabBar(
          indicatorColor: Colors.white,
          controller: _tabController,
          tabs: [
            Tab(text: 'Penjualan'),
            Tab(text: 'Pembelian'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content of Tab 1
          Center(
            child: MyProductList(),
          ),

          // Content of Tab 2
          Center(
            child: Text('Tab 2'),
          ),
        ],
      ),
    );
  }
}
