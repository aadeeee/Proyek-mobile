import 'package:flutter/material.dart';
import 'package:mobile/Provider/supplierProvider.dart';
import 'package:mobile/Variabel/global.dart';
import 'package:mobile/component/Produk/tambahProdukMasuk.dart';
import 'package:provider/provider.dart';
import 'detailsupply.dart';

class MySupplier extends StatefulWidget {
  const MySupplier({super.key});

  @override
  State<MySupplier> createState() => _MySupplierState();
}

class _MySupplierState extends State<MySupplier> {
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<MySupplierProvider>(context);
    var data = prov.filteredSupplierData.isNotEmpty
        ? prov.filteredSupplierData
        : prov.supplierData;

    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(
                controller: prov.searchController,
                onChanged: (value) {
                  final filteredData = prov.supplierData.where((supplier) {
                    final namaSupplier =
                        supplier['nama'].toString().toLowerCase();
                    final searchKeyword = value.toLowerCase();
                    return namaSupplier.contains(searchKeyword);
                  }).toList();

                  prov.updateFilteredSupplierData(filteredData);
                },
                decoration: InputDecoration(
                  focusColor: primaryColor,
                  prefixIcon: const Icon(Icons.search),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: primaryColor)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: primaryColor)),
                  hintText: 'Cari',
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: data.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final supply = data[index];
                    return ListTile(
                      title: Text(supply['nama']),
                      subtitle:
                          Text('Jumlah Produk: ${supply['produk'].length}'),
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
        ),
        floatingActionButton: const MyAddSupplier());
  }
}
