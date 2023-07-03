import 'package:flutter/material.dart';

class MySupplierProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _supplierData = [
    {
      'nama': 'PT.ABC',
      'produk': ['sapu', 'buku'],
    },
    {
      'nama': 'PT.DEF',
      'produk': ['pensil', 'tas'],
    },
  ];

  List<Map<String, dynamic>> get supplierData => _supplierData;

  TextEditingController _productNameController = TextEditingController();TextEditingController _searchController = TextEditingController();
  TextEditingController _namaController = TextEditingController();


  TextEditingController get productNameController => _productNameController;
  TextEditingController get namaController => _namaController;
  TextEditingController get searchController => _searchController;

  List<String> get availableProduk => ['sapu', 'buku', 'pensil', 'tas'];

  List<Map<String, dynamic>> _filteredSupplierData = [];

  List<Map<String, dynamic>> get filteredSupplierData => _filteredSupplierData;

  
  

  void addSupplierData(String namaSupplier, List<String> produkSupplier) {
    final newSupplier = {
      'nama': namaSupplier,
      'produk': produkSupplier,
    };

    _supplierData.add(newSupplier);
    notifyListeners();
  }

  void addProductToSupplier(String productName) {
    final newProduct = {
      'nama': productName,
      'produk': [],
    };

    _supplierData.add(newProduct);
    notifyListeners();
  }

  void addProductToPerson(int index, String productName) {
    if (index >= 0 && index < _supplierData.length) {
      final person = _supplierData[index];
      final productList = person['produk'] as List<dynamic>;
      productList.add(productName);
      notifyListeners();
    }
  }

  void updateFilteredSupplierData(List<Map<String, dynamic>> filteredData) {
    _filteredSupplierData = filteredData;
    notifyListeners();
  }
}
