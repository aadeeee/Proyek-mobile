import 'package:flutter/material.dart';
import 'package:mobile/Provider/supplierProvider.dart';
import 'package:mobile/Variabel/global.dart';
import 'package:provider/provider.dart';
import 'detailsupply.dart';

class MySupplier extends StatefulWidget {
  const MySupplier({Key? key});

  @override
  State<MySupplier> createState() => _MySupplierState();
}

class _MySupplierState extends State<MySupplier> {
  final List<String> selectedProduk = [];
  final List<int> selectedProdukQuantity = [];

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MySupplierProvider>(context);
    var data = prov.filteredSupplierData.isNotEmpty
        ? prov.filteredSupplierData
        : prov.supplierData;

    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: prov.searchController,
            decoration: InputDecoration(
              labelText: 'Cari Supplier',
            ),
            onChanged: (value) {
              final filteredData = prov.supplierData.where((supplier) {
                final namaSupplier = supplier['nama'].toString().toLowerCase();
                final searchKeyword = value.toLowerCase();
                return namaSupplier.contains(searchKeyword);
              }).toList();

              prov.updateFilteredSupplierData(filteredData);
            },
          ),
          Expanded(
            child: ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                final supply = data[index];
                return ListTile(
                  title: Text(supply['nama']),
                  subtitle: Text('Jumlah Produk: ${supply['produk'].length}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProdukPage(produk: supply),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final TextEditingController _namaController = prov.namaController;

              return StatefulBuilder(
                builder: (context, setState) {
                  return Dialog(
                    insetPadding: EdgeInsets.zero,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: primaryColor,
                        title: Text('Tambah Produk Masuk'),
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
                              decoration: InputDecoration(
                                labelText: 'Nama Supplier',
                              ),
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: prov.availableProduk.map((produk) {
                                final isSelected =
                                    selectedProduk.contains(produk);
                                final index = selectedProduk.indexOf(produk);

                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    // Wrap the ChoiceChip and TextField in a Row
                                    children: [
                                      ChoiceChip(
                                        label: Text(produk),
                                        selected: isSelected,
                                        onSelected: (selected) {
                                          setState(() {
                                            if (selected) {
                                              selectedProduk.add(produk);
                                              selectedProdukQuantity.add(0);
                                            } else {
                                              selectedProduk.remove(produk);
                                              selectedProdukQuantity
                                                  .removeAt(index);
                                            }
                                          });
                                        },
                                        selectedColor: primaryColor,
                                        labelStyle: isSelected
                                            ? TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              )
                                            : TextStyle(
                                                color: Colors.black,
                                              ),
                                      ),
                                      if (isSelected)
                                        SizedBox(
                                          width: 60,
                                          child: TextField(
                                            keyboardType: TextInputType.number,
                                            onChanged: (value) {
                                              selectedProdukQuantity[index] =
                                                  int.tryParse(value) ?? 0;
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Produk Terpilih: ${selectedProduk.join(", ")}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final namaSupplier = _namaController.text;
                                final produkSupplier = selectedProduk.toList();
                                final jumlahProduk =
                                    selectedProdukQuantity.toList();
                                prov.addSupplierData(
                                  namaSupplier,
                                  produkSupplier,
                                  jumlahProduk,
                                );
                                _namaController.clear();
                                selectedProduk.clear();
                                selectedProdukQuantity.clear();
                                Navigator.pop(context);
                              },
                              child: Text('Tambah'),
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
        child: Icon(Icons.add),
      ),
    );
  }
}
