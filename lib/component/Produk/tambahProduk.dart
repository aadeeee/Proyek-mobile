import 'package:flutter/material.dart';
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
                      title: const Text('Tambah Produk Masuk'),
                      centerTitle: false,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    body: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _namaController,
                            decoration: const InputDecoration(
                                labelText: 'Nama Penyedia',
                                labelStyle: TextStyle(color: primaryColor)),
                          ),
                          const SizedBox(height: 16),
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
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Text(produk),
                                      ),
                                      if (isSelected)
                                        SizedBox(
                                          width: 100,
                                          child: TextField(
                                            controller:
                                                _jumlahControllers[index],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                                labelText: 'Jumlah',
                                                labelStyle: TextStyle(
                                                    color: primaryColor)),
                                          ),
                                        ),
                                      SizedBox(width: 8),
                                      if (isSelected)
                                        SizedBox(
                                          width: 100,
                                          child: TextField(
                                            controller:
                                                _hargaControllers[index],
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
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
                          const SizedBox(height: 16),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Produk Terpilih: ${selectedProduk.asMap().entries.where((entry) => entry.value).map((entry) => prov.availableProduk[entry.key]).join(", ")}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final namaSupplier = _namaController.text;
                              final produkSupplier = selectedProduk
                                  .asMap()
                                  .entries
                                  .where((entry) => entry.value)
                                  .map((entry) =>
                                      prov.availableProduk[entry.key])
                                  .toList();
                              final jumlahProduk =
                                  produkSupplier.asMap().entries.map((entry) {
                                final index = entry.key;
                                final jumlah = int.tryParse(
                                        _jumlahControllers[index].text) ??
                                    0;
                                return jumlah;
                              }).toList();
                              final hargaProduk =
                                  produkSupplier.asMap().entries.map((entry) {
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
                                SnackBar(
                                  content: Text('Harap lengkapi data dengn benar!!!'),
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
                              _jumlahControllers
                                  .forEach((controller) => controller.clear());
                              _hargaControllers
                                  .forEach((controller) => controller.clear());
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
                        ],
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
