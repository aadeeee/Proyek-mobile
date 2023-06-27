import 'package:flutter/material.dart';

class MyProductProvider extends ChangeNotifier {
  final List _Product = [
    {
      "name": 'Sapu',
      'merk':"Nagata",
      "description": '-Panjang Gagang Sapu Standard 110 cm\n-Bahan Non Recycle\n-Bahan Bulu Senar dan Mengkilap\n-Mengunakan bahan bulu Grade 1\n\nWarna:  pink, hijau, abu-abu, orange, biru',
      "price": 35000,
      "imageUrl": 'assets/images/sapu.png',
      'code': 'P123ty',
      'stock': 20,
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Botol Minum',
      'merk':"Lock & Lock",
      "description": '1. Kapasitas 2000ml & 1000ml & 500ml\n2. Botol minum ringan dan mudah dibawa ,Desain modis, unik dan epik.\n3. Tidak ada bau, sehat dan aman Ini dengan kaca borosilikat tinggi dan bahan silikon food grade terbaik.\n4. Sudah BPA FREE, jadi aman untuk anak-anak dan dewasa.\n5. Tahan terhadap panas dan dingin: -20 ° C-80 ° C suhu"',
      "price": 750000,
      "imageUrl": 'assets/images/botol-minum.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Meja',
      'merk':"Polytron",
      "description": 'Ukuran Meja:70cm x 50cm x 70cm\n\n1. Papan Meja Terbuat Dari Multiplek 12mm\n2. Finishing Lapisan Meja Dengan Pvc/Tacosheet\n3. Kaki Besi Hollow Galvanis 25x25\n4. Wana Kaki Putih & Hitam Spray Gun Termasuk Alas Kaki Karet',
      "price": 1750000,
      "imageUrl": 'assets/images/meja.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Kipas Poly',
      'merk':"Polytron",
      "description": '- Bilah Kipas 16 Inch\n- Kaki Bulat\n- Bahan Body: Plastik\n- Pengaturan kecepatan: 3 Speed\n- Dilengkapi dengan tombol lampu \n- Daya; 45 Watt, 220V/50Hz',
      "price": 250000,
      "imageUrl": 'assets/images/kipas.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40
    },
    {
      "name": 'Kursi',
      'merk':"IKEA",
      "description": 'Tinggi Dudukan dari Lantai : +- 44 CM \nLebar Dudukan : +- 46 CM\nKedalaman Dudukan : +- 41 CM\nTinggi Sandaran - Lantai : +- 82 CM\nTinggi Sandaran - dudukan : +- 41 CM\n\nMaterial :Dudukan & sandaran : PP tebal (dove)\nRangka : Besi\nKaki : Kayu Solid',
      "price": 350000,
      "imageUrl": 'assets/images/kursi.png',
      'code': 'P123ty',
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
  TextEditingController _merkController = TextEditingController();
  bool isNameEmpty = false;
  bool isDecriptionEmpty = false;
  bool isPriceEmpty = false;
  bool isImageUrlEmpty = false;
  bool isCodeEmpty = false;
  bool isStockEmpty = false;
  bool isDateEmpty = false;
  bool isAmountEmpty = false;
  bool isMerkEmpty = false;

  List get Product => _Product;

  TextEditingController get getNameController => _nameController;
  TextEditingController get getDescriptionController => _descriptionController;
  TextEditingController get getPriceController => _priceController;
  TextEditingController get getImageUrlController => _imageUrlController;
  TextEditingController get getCodeController => _codeController;
  TextEditingController get getStockController => _stockController;
  TextEditingController get getDateController => _dateController;
  TextEditingController get getAmountController => _amountController;
  TextEditingController get getMerkController => _amountController;

  bool get getNameIsEmpty => isNameEmpty;
  bool get getDescriptionIsEmpty => isDecriptionEmpty;
  bool get getPriceIsEmpty => isPriceEmpty;
  bool get getImageUrlIsEmpty => isImageUrlEmpty;
  bool get getCodeIsEmpty => isImageUrlEmpty;
  bool get getStockIsEmpty => isImageUrlEmpty;
  bool get getDateIsEmpty => isImageUrlEmpty;
  bool get getAmountIsEmpty => isImageUrlEmpty;
  bool get getMerkIsEmpty => isImageUrlEmpty;

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
      _merkController.clear();
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
    if (_merkController.text.length == 0) {
      isMerkEmpty = true;
    }
    notifyListeners();
  }

  void updateProduct(List<Map<String, dynamic>> productList, int index,
      Map<String, dynamic> updatedProduct) {
    productList[index] = updatedProduct;
  }
}
