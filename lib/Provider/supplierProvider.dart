import 'package:flutter/material.dart';

class MySupplierProvider extends ChangeNotifier {
  List<Map<String, dynamic>> _supplierData = [
     {
    'nama': 'PT. Jaya Purna',
    'produk': [
      {'namaProduk': 'Sapu', "jumlah": 10, "harga": 15000,},
      {'namaProduk': 'Buku', "jumlah": 20, "harga": 5000,}
    ],
    'tanggal': DateTime(2023, 6, 1),
  },
    {
      'nama': 'PT. Rezeki',
      'produk': [
        {'namaProduk': 'Pensil', "jumlah": 30, 'harga': 2000},
        {'namaProduk': 'Tas', "jumlah": 15, 'harga': 100000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'Rumah Bersama',
      'produk': [
        {'namaProduk': 'Pensil', "jumlah": 30, 'harga': 2000},
        {'namaProduk': 'Tas', "jumlah": 15, 'harga': 100000},
        {'namaProduk': 'Ember', "jumlah": 5, 'harga': 7000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'PT. Sejati',
      'produk': [
        {'namaProduk': 'Kursi', "jumlah": 10, 'harga': 35000},
        {'namaProduk': 'Tas', "jumlah": 15, 'harga': 40000},
        {'namaProduk': 'Tikar', "jumlah": 20, 'harga': 30000},
        {'namaProduk': 'Keranjang Sampah', "jumlah": 6, 'harga': 5000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'Unggul Plastik',
      'produk': [
        {'namaProduk': 'Plastik Asoy', "jumlah": 30, 'harga': 14000},
        {'namaProduk': 'Gelas Plastik', "jumlah": 25, 'harga': 3000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'Cahaya',
      'produk': [
        {'namaProduk': 'Karpet', "jumlah": 15, 'harga': 30000},
        {'namaProduk': 'Kain Pel ', "jumlah": 15, 'harga': 16000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'PT. Usaha Keluarga',
      'produk': [
        {'namaProduk': 'Buku', "jumlah": 20, 'harga': 17000},
        {'namaProduk': 'Tas', "jumlah": 15, 'harga': 90000}
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
    {
      'nama': 'Toko Sukses',
      'produk': [
        {'namaProduk': 'Sapu', "jumlah": 15, 'harga': 20000},
        {'namaProduk': 'Buku', "jumlah": 30, 'harga': 10000},
        {'namaProduk': 'Kursi', "jumlah": 10, 'harga': 35000},
      ],
      'tanggal': DateTime(2023, 6, 1)
    },
  ];

  List<Map<String, dynamic>> get supplierData => _supplierData;

  TextEditingController _productNameController = TextEditingController();
  TextEditingController _searchController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();

  TextEditingController get productNameController => _productNameController;
  TextEditingController get namaController => _namaController;
  TextEditingController get searchController => _searchController;
  TextEditingController get getTanggalController => _tanggalController;

  List<String> get availableProduk => ['Sapu', 'Buku', 'Pensil', 'Tas'];

  List<Map<String, dynamic>> _filteredSupplierData = [];

  List<Map<String, dynamic>> get filteredSupplierData => _filteredSupplierData;

  void addSupplierData(String namaSupplier, List<String> produkSupplier,
      List<int> jumlahProduk, List<int> hargaProduk, tanggalSupplier) {
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
      'tanggal': tanggalSupplier,
    };

    _supplierData.add(newSupplier);
    notifyListeners();
  }

  void updateFilteredSupplierData(List<Map<String, dynamic>> filteredData) {
    _filteredSupplierData = filteredData;
    notifyListeners();
  }
}
