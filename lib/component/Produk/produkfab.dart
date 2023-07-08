import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:mobile/component/Produk/deskripsi.dart';
import 'package:mobile/component/Produk/tambahProdukKeluar.dart';

import 'package:provider/provider.dart';
import '../../Variabel/global.dart';

class MyProductList extends StatefulWidget {
  const MyProductList({super.key});

  @override
  _MyProductListState createState() => _MyProductListState();
}

class _MyProductListState extends State<MyProductList> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProductProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: prov.products.length,
        itemBuilder: (context, index) {
          final product = prov.products[index];
          final imagePath = product['imageUrl'];
          final isAsset =
              product.containsKey('isAsset') ? product['isAsset'] : false;
          return Card(
            child: ListTile(
              onTap: () {
                File? imageFile;
                if (!isAsset) {
                  imageFile = File(imagePath);
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => MyDescription(
                      data: product,
                      imageFile: imageFile,
                    ),
                  ),
                );
              },
              leading: isAsset
                  ? Image.asset(
                      imagePath,
                      height: 50,
                      width: 50,
                    )
                  : Image.file(
                      File(imagePath),
                      height: 50,
                      width: 50,
                    ),
              title: Text(product['name']),
              subtitle: Text(product['merk']),
              trailing: SizedBox(
                width: 112,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Rp.'),
                    Text(rupiahFormat.format(product['price'])),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: const MyAddOutCome(),
    );
  }
}
