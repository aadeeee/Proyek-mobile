import 'package:flutter/material.dart';
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
        
        title: const Center(child: Text('Data Pelanggan')), 
      backgroundColor: primaryColor,),
      body: const MyCustomerList(),
    );
  }
}
