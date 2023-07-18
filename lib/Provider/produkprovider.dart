import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class MyProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {
      "name": 'Sapu',
      'merk': "Nagata",
      "description":
          '-Panjang Gagang Sapu Standard 110 cm\n-Bahan Non Recycle\n-Bahan Bulu Senar dan Mengkilap\n-Menggunakan bahan bulu Grade 1\n\nWarna:  pink, hijau, abu-abu, orange, biru',
      "price": 35000,
      "imageUrl": 'assets/images/sapu.png',
      'code': 'P123ty',
      'stock': 20,
      'date': '10/06/2023',
      'amount': 40,
      "isAsset": true
    },
    {
      "name": 'Botol Minum',
      'merk': "Lock & Lock",
      "description":
          '1. Kapasitas 2000ml & 1000ml & 500ml\n2. Botol minum ringan dan mudah dibawa ,Desain modis, unik dan epik.\n3. Tidak ada bau, sehat dan aman Ini dengan kaca borosilikat tinggi dan bahan silikon food grade terbaik.\n4. Sudah BPA FREE, jadi aman untuk anak-anak dan dewasa.\n5. Tahan terhadap panas dan dingin: -20 ° C-80 ° C suhu"',
      "price": 750000,
      "imageUrl": 'assets/images/botol-minum.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40, "isAsset": true
    },
    {
      "name": 'Meja',
      'merk': "Polytron",
      "description":
          'Ukuran Meja:70cm x 50cm x 70cm\n\n1. Papan Meja Terbuat Dari Multiplek 12mm\n2. Finishing Lapisan Meja Dengan Pvc/Tacosheet\n3. Kaki Besi Hollow Galvanis 25x25\n4. Wana Kaki Putih & Hitam Spray Gun Termasuk Alas Kaki Karet',
      "price": 1750000,
      "imageUrl": 'assets/images/meja.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40, "isAsset": true
    },
    {
      "name": 'Kipas Poly',
      'merk': "Polytron",
      "description":
          '- Bilah Kipas 16 Inch\n- Kaki Bulat\n- Bahan Body: Plastik\n- Pengaturan kecepatan: 3 Speed\n- Dilengkapi dengan tombol lampu \n- Daya; 45 Watt, 220V/50Hz',
      "price": 250000,
      "imageUrl": 'assets/images/kipas.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40, "isAsset": true
    },
    {
      "name": 'Kursi',
      'merk': "IKEA",
      "description":
          'Tinggi Dudukan dari Lantai : +- 44 CM \nLebar Dudukan : +- 46 CM\nKedalaman Dudukan : +- 41 CM\nTinggi Sandaran - Lantai : +- 82 CM\nTinggi Sandaran - dudukan : +- 41 CM\n\nMaterial :Dudukan & sandaran : PP tebal (dove)\nRangka : Besi\nKaki : Kayu Solid',
      "price": 350000,
      "imageUrl": 'assets/images/kursi.png',
      'code': 'P123ty',
      'stock': '20',
      'date': '10/06/2023',
      'amount': 40, "isAsset": true
    },
  ];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  TextEditingController _stockController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _merkController = TextEditingController();

  List<Map<String, dynamic>> get products => _products;

  TextEditingController get getNameController => _nameController;
  TextEditingController get getDescriptionController => _descriptionController;
  TextEditingController get getPriceController => _priceController;
  TextEditingController get getCodeController => _codeController;
  TextEditingController get getStockController => _stockController;
  TextEditingController get getDateController => _dateController;
  TextEditingController get getAmountController => _amountController;
  TextEditingController get getMerkController => _merkController;

  Future<void> openImagePickerAndAddToProduct() async {
    final picker = ImagePicker();
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final directory = await getApplicationDocumentsDirectory();
      final imagePath =
          '${directory.path}/image_${DateTime.now().millisecondsSinceEpoch}.png';
      final File newImage = await File(pickedImage.path).copy(imagePath);
      final Map<String, dynamic> newProduct = {
        "name": _nameController.text,
        "merk": _merkController.text,
        "description": _descriptionController.text,
        "price": double.parse(_priceController.text),
        "imageUrl": imagePath,
        "code": _codeController.text,
        "amount": double.parse(_amountController.text),
        "date": _dateController.text,
        "isAsset": false, 
      };

      _products.add(newProduct);
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _codeController.clear();
      _amountController.clear();
      _dateController.clear();
      _merkController.clear();

      notifyListeners();
    }
  }

  void updateProduct(
      List<Map<String, dynamic>> productList, int index, Map<String, dynamic> updatedProduct) {
    productList[index] = updatedProduct;
  }

  void addProduct(Map<String, dynamic> newProduct) {
    _products.add(newProduct);
    notifyListeners();
    print(_products);
  }
}

