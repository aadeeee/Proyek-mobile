
import 'package:flutter/material.dart';

class MyCustomer extends StatefulWidget {
  const MyCustomer({super.key});

  @override
  State<MyCustomer> createState() => _MyCustomerState();
}

class _MyCustomerState extends State<MyCustomer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pelanggan'),),
    );
  }
}