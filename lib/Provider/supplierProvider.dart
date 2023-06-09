import 'package:flutter/material.dart';

class MySupplierProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _supplierData = [
    {
      'nama': 'PT.ABC',
      'produk': [
        {'namaProduk': 'sapu', "jumlah": 10, "harga": 15000},
        {'namaProduk': 'Buku', "jumlah": 20, "harga": 5000}
      ],
    },
    {
      'nama': 'PT.DEF',
      'produk': [
        {'namaProduk': 'Pensil', "jumlah": 30, 'harga': 2000},
        {'namaProduk': 'Tas', "jumlah": 15, 'harga': 100000}
      ],
    },
  ];

  List<Map<String, dynamic>> get supplierData => _supplierData;

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  TextEditingController _namaController = TextEditingController();

  TextEditingController get productNameController => _productNameController;
  TextEditingController get namaController => _namaController;
  TextEditingController get searchController => _searchController;

  List<String> get availableProduk => ['sapu', 'buku', 'pensil', 'tas'];

  List<Map<String, dynamic>> _filteredSupplierData = [];

  List<Map<String, dynamic>> get filteredSupplierData => _filteredSupplierData;

  void addSupplierData(String namaSupplier, List<String> produkSupplier,
      List<int> jumlahProduk, List<int> hargaProduk) {
    final newSupplier = {
      'nama': namaSupplier,
      'produk': List.generate(
        produkSupplier.length,
        (index) => {
          'namaProduk': produkSupplier[index],
          'jumlah': jumlahProduk[index],
          'harga': hargaProduk[index],
        },
      ),
    };

    _supplierData.add(newSupplier);
    notifyListeners();
  }

  void updateFilteredSupplierData(List<Map<String, dynamic>> filteredData) {
    _filteredSupplierData = filteredData;
    notifyListeners();
  }
}
