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
  
  List<Map<String, dynamic>> get customers => _customers;

  TextEditingController nameController = TextEditingController();
  TextEditingController orderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  TextEditingController get getNameController => nameController;
  TextEditingController get getOrderController => orderController;
  TextEditingController get getPhoneController => phoneController;

  bool _countOrder = false;

  bool get getCountOrder => _countOrder;

  set setCountOrder (value){
    _countOrder = value;
    notifyListeners();
  }
  

  bool _topBuy = false;

  bool get getTopBuy => _topBuy;

  set setTopBuy (value){
    _topBuy = value;
    notifyListeners();
  }

  bool _data = true;

  bool get getData => _data;

  set setData (value){
    _data = value;
    notifyListeners();
  }

  void addCustomer(  name,   int totalPurchase,   hp) {
    final customer = {'name': name, 'order': totalPurchase, 'hp': hp};
    _customers.add(customer);
    notifyListeners();
  }

  List<Map<String, dynamic>> getFrequentShoppers() {
    _customers.sort((a, b) => b['order'].compareTo(a['order'] ));
    return _customers;
  }

  List<Map<String, dynamic>> getTopBuyers() {
    _customers.sort((a, b) => b['order'].compareTo(a['order']));
    return _customers.sublist(0, 5);
  }
  List<Map<String, dynamic>> getSortCustomer(){
    _customers.sort((a, b) => a['name'].compareTo(b['name']));
    return _customers;
  }
  List<Map<String, dynamic>> searchCustomers(String query) {
    return _customers
        .where((customer) =>
            customer['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
