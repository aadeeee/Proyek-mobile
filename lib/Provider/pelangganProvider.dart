import 'package:flutter/material.dart';

class CustomerProvider with ChangeNotifier {
  final List<Map<String, dynamic>> _customers = [
    {
      'name': 'Budi',
      'order': 10,
      'hp': "081233545654",
      'produk': [
        'Sapu',
        'Buku',
        "Kipas",
        'Botol Minum',
        "Pensil",
        "Kursi",
        "Meja",
        "Stiker Dinding",
        'kompor',
        "Lemari"
      ]
    },
    {
      'name': 'Adi',
      'order': 4,
      'hp': "0814372435930",
      'produk': ['Sapu', 'Buku', "Kipas", 'Botol Minum']
    },
    {
      'name': 'Ani',
      'order': 9,
      'hp': "081437243593",
      'produk': [
        'Sapu',
        'Buku',
        "Kipas",
        'Botol Minum',
        "Pensil",
        "Kursi",
        "Meja",
        "Stiker Dinding",
        'kompor'
      ]
    },
    {
      'name': 'Budi',
      'order': 1,
      'hp': "081233545659",
      'produk': ['Sapu']
    },
    {
      'name': 'Kina',
      'order': 6,
      'hp': "081437243935",
      'produk': ['Sapu', 'Buku', "Kipas", 'Botol Minum', "Pensil", "Kursi"]
    },
    {
      'name': 'Poly',
      'order': 5,
      'hp': "081437242239",
      'produk': ['Sapu', 'Buku', "Kipas", 'Botol Minum', "Pensil"]
    }
  ];
  final List<String> _products = [
    'Sapu',
    'Buku',
    "Kursi",
    'Botol Minum',
    "Pensil",
    "Meja"
  ];
  List<String> get products => _products;

  List<Map<String, dynamic>> get customers => _customers;
  List<Map<String, dynamic>> filteredCustomers = [];
  List<Map<String, dynamic>> get filteredCustomer => _customers;

  TextEditingController nameController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController get getNameController => nameController;
  TextEditingController get getOrderController => orderController;
  TextEditingController get getPhoneController => phoneController;

  bool _countOrder = false;

  bool get getCountOrder => _countOrder;

  set setCountOrder(value) {
    _countOrder = value;
    notifyListeners();
  }

  bool _topBuy = false;

  bool get getTopBuy => _topBuy;

  set setTopBuy(value) {
    _topBuy = value;
    notifyListeners();
  }

  void addCustomer(name, int totalPurchase, hp, selectedProduk) {
    final customer = {
      'name': name,
      'order': totalPurchase,
      'hp': hp,
      'produk': selectedProduk
    };
    _customers.add(customer);
    notifyListeners();
  }

  List<Map<String, dynamic>> getFrequentShoppers() {
    _customers.sort((a, b) => b['order'].compareTo(a['order']));
    return _customers;
  }

  List<Map<String, dynamic>> getTopBuyers() {
    _customers.sort((a, b) => a['order'].compareTo(b['order']));
    return _customers;
  }

  List<Map<String, dynamic>> searchCustomers(String searchText) {
    if (searchText.isEmpty) {
      return customers;
    } else {
      return customers
          .where((customer) =>
              customer['name'].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    }
  }
}
