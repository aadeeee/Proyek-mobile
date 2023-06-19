import 'package:flutter/material.dart';

class MyProductProvider extends ChangeNotifier {
  final List _Product = [
    {
      "name": 'Sapu',
      "description": 'Nagata',
      "price": 35000,
      "imageUrl": 'assets/images/sapu.png',
    },
    {
      "name": 'Botol Minum',
      "description": 'Lock & Lock',
      "price": 750000,
      "imageUrl": 'assets/images/botol-minum.png',
    },
    {
      "name": 'Meja',
      "description": 'IKEA',
      "price": 1750000,
      "imageUrl": 'assets/images/meja.png',
    },
    {
      "name": 'Kipas',
      "description": 'Polytron',
      "price": 250000,
      "imageUrl": 'assets/images/kipas.png',
    },
    {
      "name": 'Kursi',
      "description": 'IKEA',
      "price": 350000,
      "imageUrl": 'assets/images/kursi.png',
    },
  ];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  bool isNameEmpty = false;
  bool isDecriptionEmpty = false;
  bool isPriceEmpty = false;
  bool isImageUrlEmpty = false;

  List get Product => _Product;
  
  TextEditingController get getNameController => _nameController;
  TextEditingController get getDescriptionController => _descriptionController;
  TextEditingController get getPriceController => _priceController;
  TextEditingController get getImageUrlController => _imageUrlController;
  TextEditingController get getCodeController => _codeController;
  TextEditingController get getStockController => _stockController;
  TextEditingController get getDateController => _dateController;

  bool get getNameIsEmpty => isNameEmpty;
  bool get getDescriptionIsEmpty => isDecriptionEmpty;
  bool get getPriceIsEmpty => isPriceEmpty;
  bool get getImageUrlIsEmpty => isImageUrlEmpty;

  set AddProduct(value) {
    if (_descriptionController.text.length != 0 &&
        _nameController.text.length != 0 &&
        _imageUrlController.text.length != 0 &&
        _priceController.text.length != 0) {
      _Product.add(value);
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _imageUrlController.clear();
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
     notifyListeners();
  }

 
}
// }

  
//   TextEditingController _imageUrlController = TextEditingController();
  
//   TextEditingController get getNameController => _nameController;
//   TextEditingController get getDescriptionController => _descriptionController;
//   TextEditingController get getPriceController => _priceController;
//   TextEditingController get getImageUrlController => _imageUrlController;
  
//   bool isNameEmpty = false;
//   bool isDecriptionEmpty = false;
//   bool isPriceEmpty = false;
//   bool isImageUrlEmpty = false;
//   bool isCodeEmpty = false;
//   bool isStockEmpty = false;
//   bool isDateEmpty = false;

//   set nameEmpty(value) {
//     isNameEmpty = value;
//     notifyListeners();
//   }

//   set descriptionEmpty(value) {
//     isDecriptionEmpty = value;
//     notifyListeners();
//   }

//   set priceEmpty(value) {
//     isPriceEmpty = value;
//     notifyListeners();
//   }

//   set imageUrlEmpty(value) {
//     isImageUrlEmpty = value;
//     notifyListeners();
//   }
//    set codeEmpty(value) {
//     isCodeEmpty = value;
//     notifyListeners();
//   }

//   set stockEmpty(value) {
//     isStockEmpty = value;
//     notifyListeners();
//   }

//   set dateEmpty(value) {
//     isDateEmpty = value;
//     notifyListeners();
//   }




  // void _addProduct() {
  //   setState(() {
  //     products.add(
  //       Product(
  //         name: _nameController.text,
  //         description: _descriptionController.text,
  //         price: double.parse(_priceController.text),
  //         imageUrl: _imageUrlController.text,
  //       ),
  //     );

  //     _nameController.clear();
  //     _descriptionController.clear();
  //     _priceController.clear();
  //     _imageUrlController.clear();
  //   });
