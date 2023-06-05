import 'package:flutter/material.dart';

class MyEmailProvider extends ChangeNotifier {

  // Email Activation Provider
  TextEditingController codeController = TextEditingController();

  TextEditingController get getCodeController => codeController;

  bool get getCodeIsEmpty => isCodeEmpty;

  bool isCodeEmpty = false;
  
  set codeEmpty(value) {
    isCodeEmpty = value;
    notifyListeners();
  }

  
}
