import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              // Menyaring supplier berdasarkan input pencarian
              final filteredData = prov.supplierData.where((supplier) {
                final namaSupplier = supplier['nama'].toString().toLowerCase();
                final searchKeyword = value.toLowerCase();
                return namaSupplier.contains(searchKeyword);
              }).toList();

              // Mengupdate tampilan berdasarkan hasil pencarian
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
              final TextEditingController _namaController =
                  prov.productNameController;

              return StatefulBuilder(
                builder: (context, setState) {
                  return Dialog(
                    insetPadding: EdgeInsets.zero,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: primaryColor,
                        title: Text('Tambah Produk Masuk',
                            style: GoogleFonts.inter()),
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
                            Wrap(
                              spacing: 8,
                              children: prov.availableProduk.map((produk) {
                                final isSelected =
                                    selectedProduk.contains(produk);

                                return ChoiceChip(
                                  label: Text(produk),
                                  selected: isSelected,
                                  onSelected: (selected) {
                                    setState(() {
                                      if (selected) {
                                        selectedProduk.add(produk);
                                      } else {
                                        selectedProduk.remove(produk);
                                      }
                                    });
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Produk Terpilih: ${selectedProduk.join(", ")}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final namaSupplier = _namaController.text;
                                final produkSupplier = selectedProduk.toList();
                                prov.addSupplierData(
                                  namaSupplier,
                                  produkSupplier,
                                );
                                _namaController.clear();
                                selectedProduk.clear();
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
