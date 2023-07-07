import 'package:flutter/material.dart';
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
        title: const Text("Detail Pelanggan"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pelanggan: ${widget.customer['name']}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Text(
                'Jumlah Pesanan: ${widget.customer['order']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text(
                'Nomor Telepon: ${widget.customer['hp']}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              const Text(
                'Produk yang Dibeli:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  widget.customer['produk'].length,
                  (index) => Text(
                    '- ${widget.customer['produk'][index]}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
