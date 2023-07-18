import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import '../../Provider/produkprovider.dart';
import '../../Variabel/global.dart';
import 'dart:io';

class MyAddOutCome extends StatefulWidget {
  const MyAddOutCome({super.key});

  @override
  State<MyAddOutCome> createState() => _MyAddOutComeState();
}

class _MyAddOutComeState extends State<MyAddOutCome> {
  String? _imagePath;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MyProductProvider>(context);
    return FloatingActionButton(
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
                  title:
                      Text('Tambah Produk Keluar', style: GoogleFonts.inter()),
                  centerTitle: true,
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(
                              child: Image.asset(
                            'assets/images/produkkeluar.png',
                            height: 200,
                          )),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getCodeController,
                          decoration: const InputDecoration(
                            labelText: 'Kode Produk',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getNameController,
                          decoration: const InputDecoration(
                            labelText: 'Nama Produk',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getMerkController,
                          decoration: const InputDecoration(
                            labelText: 'Merek',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getDescriptionController,
                          decoration: const InputDecoration(
                            labelText: 'Deskripsi',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getPriceController,
                          decoration: const InputDecoration(
                            labelText: 'Harga',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              const Text(
                                'Gambar Produk : ',
                                style: TextStyle(fontSize: 15),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final picker = ImagePicker();
                                  final XFile? pickedImage =
                                      await picker.pickImage(
                                    source: ImageSource.gallery,
                                  );
                                  if (pickedImage != null) {
                                    final File newImage =
                                        File(pickedImage.path);
                                    setState(() {
                                      _imagePath = pickedImage.path;
                                    });
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor),
                                child:  Row(
                                  children: [
                                    Icon(Icons.add),
                                    Icon(Icons.photo_size_select_actual_rounded)
                                  ],
                                ),
                              ),
                              if (_imagePath != null)
                                Expanded(
                                  child: Text(
                                    'Link: ${_imagePath!.split('/').last}',
                                    style: TextStyle(fontSize: 16),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getAmountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Penjualan',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
                          controller: prov.getStockController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Jumlah Stok',
                          ),
                        ),
                        TextField(
                          cursorColor: Colors.black,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                if (prov.getCodeController.text.isEmpty ||
                                    prov.getNameController.text.isEmpty ||
                                    prov.getMerkController.text.isEmpty ||
                                    prov.getDescriptionController.text
                                        .isEmpty ||
                                    prov.getPriceController.text.isEmpty ||
                                    prov.getAmountController.text.isEmpty ||
                                    prov.getDateController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'Harap lengkapi data dengan benar!!!',
                                      ),
                                    ),
                                  );
                                  return;
                                }

                                if (_imagePath != null) {
                                  final newProduct = {
                                    "name": prov.getNameController.text,
                                    "merk": prov.getMerkController.text,
                                    "description":
                                        prov.getDescriptionController.text,
                                    "price": double.parse(
                                        prov.getPriceController.text),
                                    "imageUrl": _imagePath!,
                                    "code": prov.getCodeController.text,
                                    "amount": double.parse(
                                        prov.getAmountController.text),
                                    "date": prov.getDateController.text,
                                    'stock': prov.getStockController.text
                                  };
                                  _imagePath = null;
                                  prov.addProduct(newProduct);
                                }

                                prov.getCodeController.clear();
                                prov.getNameController.clear();
                                prov.getMerkController.clear();
                                prov.getDescriptionController.clear();
                                prov.getPriceController.clear();
                                prov.getAmountController.clear();
                                prov.getStockController.clear();
                                prov.getDateController.clear();

                                Navigator.of(context).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'Tambah',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          ),
                        ),
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
    );
  }
}
