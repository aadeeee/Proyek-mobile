import 'package:flutter/material.dart';
import 'package:mobile/Variabel/global.dart';

class ProdukPage extends StatefulWidget {
  final Map<String, dynamic> produk;

  const ProdukPage({super.key, required this.produk});

  @override
  State <ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: widget.produk['produk'].length,
        itemBuilder: (context, index) {
          final produkData = widget.produk['produk'][index];
          final namaProduk = produkData['namaProduk'];
          final jumlahProduk = produkData['jumlah'];

          return ListTile(
            title: Text('$namaProduk \nJumlah : $jumlahProduk'),
          );
        },
      ),
    );
  }
}
