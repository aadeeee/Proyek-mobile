import 'package:flutter/material.dart';

class MyProductProvider extends ChangeNotifier {
  final List _Product = [
    {
      "name": 'Sapu',
      "description": 'Nagata',
      "price": 35000,
      "imageUrl": 'assets/images/sapu.png',
      'code': 'p123ty',
      'stock': 20,
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Botol Minum',
      "description": 'Lock & Lock',
      "price": 750000,
      "imageUrl": 'assets/images/botol-minum.png',
      'code': 'p123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Meja',
      "description": 'IKEA',
      "price": 1750000,
      "imageUrl": 'assets/images/meja.png',
      'code': 'p123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Kipas',
      "description": 'Polytron',
      "price": 250000,
      "imageUrl": 'assets/images/kipas.png',
      'code': 'p123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Kursi',
      "description": 'IKEA',
      "price": 350000,
      "imageUrl": 'assets/images/kursi.png',
      'code': 'p123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
  ];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  bool isNameEmpty = false;
  bool isDecriptionEmpty = false;
  bool isPriceEmpty = false;
  bool isImageUrlEmpty = false;
  bool isCodeEmpty = false;
  bool isStockEmpty = false;
  bool isDateEmpty = false;
  bool isAmountEmpty = false;

  List get Product => _Product;

  TextEditingController get getNameController => _nameController;
  TextEditingController get getDescriptionController => _descriptionController;
  TextEditingController get getPriceController => _priceController;
  TextEditingController get getImageUrlController => _imageUrlController;
  TextEditingController get getCodeController => _codeController;
  TextEditingController get getStockController => _stockController;
  TextEditingController get getDateController => _dateController;
  TextEditingController get getAmountController => _amountController;

  bool get getNameIsEmpty => isNameEmpty;
  bool get getDescriptionIsEmpty => isDecriptionEmpty;
  bool get getPriceIsEmpty => isPriceEmpty;
  bool get getImageUrlIsEmpty => isImageUrlEmpty;
  bool get getCodeIsEmpty => isImageUrlEmpty;
  bool get getStockIsEmpty => isImageUrlEmpty;
  bool get getDateIsEmpty => isImageUrlEmpty;
  bool get getAmountIsEmpty => isImageUrlEmpty;

  get context => null;

  get index => null;

  set AddProduct(value) {
    if (_descriptionController.text.length != 0 &&
        _nameController.text.length != 0 &&
        _imageUrlController.text.length != 0 &&
        _priceController.text.length != 0 &&
        _amountController.text.length != 0 &&
        _codeController.text.length != 0 &&
        _dateController.text.length != 0) {
      _Product.add(value);
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _imageUrlController.clear();
      _codeController.clear();
      _amountController.clear();
      _dateController.clear();
    }
    if (_descriptionController.text.length == 0) {
      isDecriptionEmpty = true;
    }
    if (_nameController.text.length == 0) {
      isNameEmpty = true;
    }
    if (_imageUrlController.text.length == 0) {
      isImageUrlEmpty = true;
    }
    if (_priceController.text.length == 0) {
      isPriceEmpty = true;
    }
    if (_amountController.text.length == 0) {
      isAmountEmpty = true;
    }
    if (_codeController.text.length == 0) {
      isCodeEmpty = true;
    }
    if (_dateController.text.length == 0) {
      isDateEmpty = true;
    }
    notifyListeners();
  }

  void updateProduct(List<Map<String, dynamic>> productList, int index,
      Map<String, dynamic> updatedProduct) {
    productList[index] = updatedProduct;
  }
}
