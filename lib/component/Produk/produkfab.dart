import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/Provider/produkprovider.dart';
import 'package:mobile/component/Produk/deskripsi.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                insetPadding: EdgeInsets.zero,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: primaryColor,
                    title: Text('Tambah Produk', style: GoogleFonts.inter()),
                    centerTitle: false,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: prov.getCodeController,
                            decoration: InputDecoration(
                                labelText: 'Kode Produk',
                                errorText:
                                    prov.isCodeEmpty ? "wajib diisi" : null),
                          ),
                          TextField(
                            controller: prov.getNameController,
                            decoration: InputDecoration(
                                labelText: 'Nama Produk',
                                errorText:
                                    prov.isNameEmpty ? "wajib diisi" : null),
                          ),
                          TextField(
                            controller: prov.getMerkController,
                            decoration: InputDecoration(
                                labelText: 'Merek',
                                errorText:
                                    prov.isMerkEmpty ? "wajib diisi" : null),
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
                          TextField(
                            controller: prov.getAmountController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Jumlah Penjualan',
                                errorText:
                                    prov.isAmountEmpty ? "wajib diisi" : null),
                          ),
                          TextField(
                            controller: prov.getStockController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Jumlah Stok',
                                errorText:
                                    prov.isAmountEmpty ? "wajib diisi" : null),
                          ),
                         TextField(
                              controller: prov.getDateController,
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  cancelText: "Batal",
                                  confirmText: 'Pilih',
                                  context: context,
                                  builder: (BuildContext context, Widget? child) {
                                    return Theme(
                                      data: ThemeData(
                                        colorScheme: const ColorScheme.light(
                                          primary: primaryColor,
                                        ),
                                      ),
                                      child: child ?? const Text(""),
                                    );
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2024),
                                ).then((selectedDate) {
                                  if (selectedDate != null) {
                                    setState(() {
                                      prov.getDateController.text =
                                          DateFormat('yyyy/MM/dd')
                                              .format(selectedDate);
                                    });
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                labelText: 'Tanggal Penjualan',
                                
                              ),
                            ),
                          
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              prov.AddProduct = {
                                "name": prov.getNameController.text,
                                "merk": prov.getMerkController.text,
                                "description": prov.getDescriptionController.text,
                                "price":
                                    double.parse(prov.getPriceController.text),
                                "imageUrl": prov.getImageUrlController.text,
                                "code": prov.getCodeController.text,
                                "amount":
                                    double.parse(prov.getAmountController.text),
                                "date": prov.getDateController.text,
                              };
                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'Tambah',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
