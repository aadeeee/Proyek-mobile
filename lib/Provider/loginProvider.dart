import 'package:flutter/material.dart';

class MyLoginProvider extends ChangeNotifier {
  //Login and register provider
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController get getUserNameController => usernameController;
  TextEditingController get getPasswordController => passwordController;

  bool isUserNameEmpty = false;
  bool isPasswordEmpty = false;

  set userNameEmpty(value) {
    isUserNameEmpty = value;
    notifyListeners();
  }

  set passwordEmpty(value) {
    isPasswordEmpty = value;
    notifyListeners();
  }

  bool get getUserNameIsEmpty => isUserNameEmpty;
  bool get getUPasswordIsEmpty => isPasswordEmpty;

  
}
