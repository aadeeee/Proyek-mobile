import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Provider/supplierProvider.dart';
import '../../Variabel/global.dart';

class MyAddSupplier extends StatefulWidget {
  const MyAddSupplier({super.key});

  @override
  State<MyAddSupplier> createState() => _MyAddSupplierState();
}

class _MyAddSupplierState extends State<MyAddSupplier> {
  late List<bool> selectedProduk;
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MySupplierProvider>(context);
    selectedProduk = List.generate(
      prov.availableProduk.length,
      (index) => false,
    );
    return FloatingActionButton(
      backgroundColor: primaryColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            final TextEditingController _namaController = prov.namaController;
            final List<TextEditingController> _jumlahControllers =
                List.generate(prov.availableProduk.length,
                    (index) => TextEditingController());
            final List<TextEditingController> _hargaControllers = List.generate(
                prov.availableProduk.length,
                (index) => TextEditingController());

            return StatefulBuilder(
              builder: (context, setState) {
                return Dialog(
                  insetPadding: EdgeInsets.zero,
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: primaryColor,
                      title: Text('Tambah Produk Masuk',
                          style: GoogleFonts.inter()),
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
                          children: [
                            SizedBox(
                                child: Image.asset(
                              'assets/images/produkmasuk.png',
                              height: 200,
                            )),
                            const SizedBox(
                              height: 16,
                            ),
                            TextField(
                              cursorColor: Colors.black,
                              controller: _namaController,
                              decoration: const InputDecoration(
                                  icon: Icon(Icons.factory,
                                      color: primaryColor, size: 30),
                                  labelText: 'Nama Penyedia',
                                  labelStyle: TextStyle(color: primaryColor)),
                            ),
                            TextField(
                              // controller: prov.getTanggalController,
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                  cancelText: "Batal",
                                  confirmText: 'Pilih',
                                  context: context,
                                  builder:
                                      (BuildContext context, Widget? child) {
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
                                    // setState(() {
                                    //   prov.getTanggalController.text =
                                    //       DateFormat('yyyy/MM/dd')
                                    //           .format(selectedDate);
                                    // });
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                focusColor: primaryColor,
                                icon: Icon(Icons.calendar_month_outlined,
                                    color: primaryColor, size: 30),
                                labelText: 'Pilih Tanggal',
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text(
                              'Daftar Produk',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                prov.availableProduk.length,
                                (index) {
                                  final produk = prov.availableProduk[index];
                                  final isSelected = selectedProduk[index];

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: isSelected,
                                          activeColor: primaryColor,
                                          onChanged: (selected) {
                                            setState(() {
                                              selectedProduk[index] =
                                                  selected ?? false;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Text(produk),
                                        ),
                                        if (isSelected)
                                          SizedBox(
                                            width: 100,
                                            child: TextField(
                                              controller:
                                                  _jumlahControllers[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  labelText: 'Jumlah',
                                                  labelStyle: TextStyle(
                                                      color: primaryColor)),
                                            ),
                                          ),
                                        const SizedBox(width: 8),
                                        if (isSelected)
                                          SizedBox(
                                            width: 100,
                                            child: TextField(
                                              controller:
                                                  _hargaControllers[index],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  labelText: 'Harga',
                                                  labelStyle: TextStyle(
                                                      color: primaryColor)),
                                            ),
                                          ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                            
                            const Divider(),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    ' Produk Terpilih : ${selectedProduk.asMap().entries.where((entry) => entry.value).map((entry) => prov.availableProduk[entry.key]).join(", ")}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  final namaSupplier = _namaController.text;
                                  final produkSupplier = selectedProduk
                                      .asMap()
                                      .entries
                                      .where((entry) => entry.value)
                                      .map((entry) =>
                                          prov.availableProduk[entry.key])
                                      .toList();
                                  final jumlahProduk = produkSupplier
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final jumlah = int.tryParse(
                                            _jumlahControllers[index].text) ??
                                        0;
                                    return jumlah;
                                  }).toList();
                                  final hargaProduk = produkSupplier
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                    final index = entry.key;
                                    final harga = int.tryParse(
                                            _hargaControllers[index].text) ??
                                        0;
                                    return harga;
                                  }).toList();
                                  if (namaSupplier.isEmpty ||
                                      jumlahProduk.contains(0) ||
                                      hargaProduk.contains(0)) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'Harap lengkapi data dengan benar!!!'),
                                      ),
                                    );
                                    return;
                                  }

                                  prov.addSupplierData(
                                    namaSupplier,
                                    produkSupplier,
                                    jumlahProduk,
                                    hargaProduk,
                                  );
                                  _namaController.clear();
                                  selectedProduk.clear();
                                  _jumlahControllers.forEach(
                                      (controller) => controller.clear());
                                  _hargaControllers.forEach(
                                      (controller) => controller.clear());
                                  Navigator.pop(context);
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
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
