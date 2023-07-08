import 'package:flutter/material.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:mobile/component/Produk/deskripsi.dart';
import 'package:mobile/component/Produk/tambahProdukMasuk.dart';
import 'package:provider/provider.dart';
import '../../Variabel/global.dart';

class MyProductList extends StatefulWidget {
  const MyProductList({super.key});
  @override
  State<MyProductList> createState() => _MyProductListState();
}

class _MyProductListState extends State<MyProductList> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProductProvider>(context);
    return Scaffold(
      body: ListView.builder(
        itemCount: prov.Product.length,
        itemBuilder: (context, index) {
          final product = prov.Product[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => MyDescription(
                              data: prov.Product[index],
                            )));
              },
              leading: Image.asset(
                product["imageUrl"],
                height: 50,
                width: 50,
              ),
              title: Text(product["name"]),
              subtitle: Text(product["merk"]),
              trailing: SizedBox(
                width: 112,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text('Rp.'),
                    Text(rupiahFormat.format((product['price'])))
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: const MyAddOutCome()
    );
  }
}
