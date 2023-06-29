import 'package:flutter/material.dart';

class CustomerProvider with ChangeNotifier {
  List<Map<String, dynamic>> _customers = [
    {'name': 'Budi', 'order': 10, 'hp': "08123354565"},
    {'name': 'Adi', 'order': 4, 'hp': "0814372435935"},
    {'name': 'aaa', 'order': 9, 'hp': "0814372435935"},
    {'name': 'Budi', 'order': 1, 'hp': "08123354565"},
    {'name': 'Adi', 'order': 15, 'hp': "0814372435935"},
    {'name': 'aaa', 'order': 4, 'hp': "0814372435935"}
  ];

  List<Map<String, dynamic>> _customers2 = [
    {'name': 'Budi', 'order': 10, 'hp': "08123354565"},
    {'name': 'Adi', 'order': 4, 'hp': "0814372435935"},
    {'name': 'aaa', 'order': 9, 'hp': "0814372435935"},
    {'name': 'Budi', 'order': 1, 'hp': "08123354565"},
    {'name': 'Adi', 'order': 15, 'hp': "0814372435935"},
    {'name': 'aaa', 'order': 4, 'hp': "0814372435935"}
  ];

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

  void addCustomer(name, int totalPurchase, hp) {
    final customer = {'name': name, 'order': totalPurchase, 'hp': hp};
    _customers.add(customer);
    _customers2.add(customer);
    notifyListeners();
  }

  List<Map<String, dynamic>> getFrequentShoppers() {
    _customers.sort((a, b) => b['order'].compareTo(a['order']));
    return _customers;
  }

  List<Map<String, dynamic>> getTopBuyers() {
    _customers2.sort((a, b) => b['order'].compareTo(a['order']));
    return _customers2.sublist(0, 5);
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
