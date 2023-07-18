import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/component/Pelanggan/customer.dart';

import '../../Variabel/global.dart';

class MyCustomer extends StatefulWidget {
  const MyCustomer({super.key});

  @override
  State<MyCustomer> createState() => _MyCustomerState();
}

class _MyCustomerState extends State<MyCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Center(child: Text('Data Pelanggan', style: GoogleFonts.inter())),
        backgroundColor: primaryColor,
      ),
      body: const MyCustomerList(),
    );
  }
}
