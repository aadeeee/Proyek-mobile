import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Variabel/global.dart';

class ProdukPage extends StatefulWidget {
  final Map<String, dynamic> produk;

  const ProdukPage({Key? key, required this.produk}) : super(key: key);

  @override
  State<ProdukPage> createState() => _ProdukPageState();
}

class _ProdukPageState extends State<ProdukPage> {
  num totalSubtotal = 0;

  @override
  void initState() {
    super.initState();
    calculateTotalSubtotal();
  }

  void calculateTotalSubtotal() {
    totalSubtotal = 0;
    for (final produkData in widget.produk['produk']) {
      final jumlahProduk = produkData['jumlah'];
      final hargaProduk = produkData['harga'];
      final subtotal = jumlahProduk * (hargaProduk as num);
      totalSubtotal += subtotal;
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.produk['nama'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Produk', style: GoogleFonts.inter()),
        backgroundColor: primaryColor,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                data,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: widget.produk['produk'].length,
              itemBuilder: (context, index) {
                final produkData = widget.produk['produk'][index];
                final namaProduk = produkData['namaProduk'];
                final jumlahProduk = produkData['jumlah'];
                final hargaProduk = produkData['harga'];
                final subtotal = jumlahProduk * (hargaProduk as num);
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nama Produk    : $namaProduk',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4.0),
                          Text('Jumlah               : $jumlahProduk'),
                          const SizedBox(height: 4.0),
                          Text(
                              'Harga Satuan    : Rp. ${rupiahFormat.format(hargaProduk)}'),
                          const SizedBox(height: 4.0),
                          Text(
                              'Subtotal              : Rp. ${rupiahFormat.format(subtotal)}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              width: 350,
              // height: 50,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tanggal Pembelian : ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'tgl',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (Rp)                  : ',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '${rupiahFormat.format(totalSubtotal)}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
