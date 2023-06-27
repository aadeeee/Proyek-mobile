import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';


class MyProductListBeli extends StatefulWidget {
  const MyProductListBeli({super.key});

  @override
  State<MyProductListBeli> createState() => _MyProductLisBeliState();
}

class _MyProductLisBeliState extends State<MyProductListBeli> {
  final rupiahFormat = NumberFormat.currency(locale: 'ID',symbol: "",decimalDigits: 0);

  @override
  void dispose() {
    super.dispose();
  }

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
              leading: Image.asset(product["imageUrl"]),
              title: Text(product["name"]),
              subtitle: Text(product["description"]),
              onTap: () {
                
              },
              trailing: 
              Container(
                width: 112,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [Text('Rp.'),Text(rupiahFormat.format((product['price'])))],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffFD61876E),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('Tambah Produk',style: GoogleFonts.inter()),
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          prov.AddProduct = {
                            "name": prov.getNameController.text,
                            "description": prov.getDescriptionController.text,
                            "price": double.parse(prov.getPriceController.text),
                            "imageUrl": prov.getImageUrlController.text,
                          };
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Tambah',
                          style: GoogleFonts.inter(color: Colors.white)
                        ),
                      ),
                    ],
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: prov.getNameController,
                          decoration: InputDecoration(
                              labelText: 'Nama Produk',
                              errorText:
                                  prov.isNameEmpty ? "wajib diisi" : null),
                        ),
                        TextField(
                          controller: prov.getDescriptionController,
                          decoration: InputDecoration(
                              labelText: 'Deskripsi',
                              errorText: prov.isDecriptionEmpty
                                  ? "wajib diisi"
                                  : null),
                        ),
                        TextField(
                          controller: prov.getPriceController,
                          decoration: InputDecoration(
                              labelText: 'Harga',
                              errorText: prov.isPriceEmpty
                                  ? "Gunakan format yang tepat"
                                  : null),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: prov.getImageUrlController,
                          decoration: InputDecoration(
                              labelText: 'Link gambar',
                              errorText:
                                  prov.isImageUrlEmpty ? "wajib diisi" : null),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
