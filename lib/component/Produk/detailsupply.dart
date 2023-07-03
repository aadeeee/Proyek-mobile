import 'package:flutter/material.dart';
import 'package:mobile/Variabel/global.dart';

class ProdukPage extends StatelessWidget {
  final Map<String, dynamic> produk;

  ProdukPage({required this.produk, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk'),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: produk['produk'].length,
        itemBuilder: (context, index) {
          final produkdata = produk['produk'][index];
          return ListTile(
            title: Text(produkdata),
          );
        },
      ),
    );
  }
}
