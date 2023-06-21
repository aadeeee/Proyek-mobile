import 'package:flutter/material.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:provider/provider.dart';

class MyEditBuy extends StatefulWidget {
  const MyEditBuy({super.key});

  @override
  State<MyEditBuy> createState() => _MyEditBuyState();
}

class _MyEditBuyState extends State<MyEditBuy> {
  get index => null;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProductProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: prov.Product.length,
        itemBuilder: (context, index) {
          final product = prov.Product[index];
          return Card(
            child: TextField(
              controller: product['name'],
            ),
          );
        },
      ),
    );
  }
}