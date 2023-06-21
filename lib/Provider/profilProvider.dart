import 'package:flutter/material.dart';

class ProfilProvider extends ChangeNotifier {
  bool _switchValue = false;

  bool get getterswitchvalue => _switchValue;

  set setterswitchValue(val) {
    _switchValue = val;
    notifyListeners();
  }

  final ThemeData _darkTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  final ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light);

  ThemeData getTheme() {
    return getterswitchvalue ? _darkTheme : _lightTheme;
  }

  String? namaPemilikToko = 'Zeus';
  String? namaToko = 'Toko Sejahtera';
  String? alamatToko = 'Medan';
  String? kategori = 'Kelontong';
  TextEditingController namaPemilikTokoController = TextEditingController(text: 'Zeus');
  TextEditingController namaTokoController = TextEditingController(text: 'Toko Sejahtera');
  TextEditingController alamatTokoController = TextEditingController(text: 'Medan');
  TextEditingController kategoriController = TextEditingController(text: 'Kelontong');

  TextEditingController get getNamaPemilikTokoController => namaPemilikTokoController;
 
  TextEditingController get getNamaTokoController => namaTokoController;
  TextEditingController get getAlamatTokoController => alamatTokoController;
  TextEditingController get getKategoridController => kategoriController;

  void updateProfile(String newNamaPemilikToko, String newNamaToko,
      String newAlamatToko, String newKategori) {
    namaPemilikToko = newNamaPemilikToko;
    namaToko = newNamaToko;
    alamatToko = newAlamatToko;
    kategori = newKategori;
    notifyListeners();
  }
}
