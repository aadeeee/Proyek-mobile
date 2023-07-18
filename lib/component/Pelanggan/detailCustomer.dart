import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Variabel/global.dart';

class MyDetailCustomer extends StatefulWidget {
  final Map<String, dynamic> customer;

  const MyDetailCustomer({super.key, required this.customer});

  @override
  State<MyDetailCustomer> createState() => _MyDetailCustomerState();
}

class _MyDetailCustomerState extends State<MyDetailCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pelanggan", style: GoogleFonts.inter()),
        centerTitle: true,
        backgroundColor: primaryColor,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    child: Image.asset(
                  'assets/images/detailpelanggan.png',
                  height: 250,
                )),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                    // color: primaryColor,
                    border: Border.all(color: primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                // color: primaryColor,
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama Pelanggan       : ${widget.customer['name']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Jumlah Pesanan        : ${widget.customer['order']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nomor Telepon           : ${widget.customer['hp']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Produk yang Dibeli     : ',
                          style: TextStyle(fontSize: 16, height: 1.5),
                        ),
                        // const SizedBox(height: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            widget.customer['produk'].length,
                            (index) => Text(
                              ' - ${widget.customer['produk'][index]}',
                              style: const TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
