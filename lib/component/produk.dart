

import 'package:flutter/material.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text("Produk")),
    );
  }
}