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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextField(
                          controller: prov.getCodeController,
                          decoration: InputDecoration(
                            labelText: 'Kode Produk',
                          ),
                        ),
                        TextField(
                          controller: prov.getNameController,
                          decoration: InputDecoration(
                            labelText: 'Nama Produk',
                          ),
                        ),
                        TextField(
                          controller: prov.getMerkController,
                          decoration: InputDecoration(
                            labelText: 'Merek',
                          ),
                        ),
                        TextField(
                          controller: prov.getDescriptionController,
                          decoration: InputDecoration(
                            labelText: 'Deskripsi',
                          ),
                        ),
                        TextField(
                          controller: prov.getPriceController,
                          decoration: InputDecoration(
                            labelText: 'Harga',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                final picker = ImagePicker();
                                final XFile? pickedImage =
                                    await picker.pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (pickedImage != null) {
                                  final File newImage = File(pickedImage.path);
                                  setState(() {
                                    _imagePath = pickedImage.path;
                                  });
                                }
                              },
                              child: const Text('Pilih Gambar'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor),
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
                        TextField(
                          controller: prov.getAmountController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Jumlah Penjualan',
                          ),
                        ),
                        TextField(
                          controller: prov.getStockController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Jumlah Stok',
                          ),
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
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              if (prov.getCodeController.text.isEmpty ||
                                  prov.getNameController.text.isEmpty ||
                                  prov.getMerkController.text.isEmpty ||
                                  prov.getDescriptionController.text.isEmpty ||
                                  prov.getPriceController.text.isEmpty ||
                                  prov.getAmountController.text.isEmpty ||
                                  prov.getDateController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
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
