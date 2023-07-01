import 'package:flutter/material.dart';
import 'package:mobile/component/Pelanggan/Customer.dart';

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
        
        title: Center(child: Text('Data Pelanggan')), 
      backgroundColor: primaryColor,),
      body: MyCustomerList(),
    );
  }
}
