import 'package:flutter/material.dart';

class MyRegisProvider extends ChangeNotifier {
  //Login and register provider
  TextEditingController usernameController = TextEditingController();
  TextEditingController nohandphoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  TextEditingController get getUserNameController => usernameController;
  TextEditingController get getNoHandphoneController => nohandphoneController;
  TextEditingController get getEmailController => emailController;
  TextEditingController get getPasswordController => passwordController;
  TextEditingController get getRePasswordController => repasswordController;

  bool isUserNameEmpty = false;
  bool isNoHandphoneEmpty = false;
  bool isEmailEmpty = false;
  bool isPasswordEmpty = false;
  bool isRePasswordEmpty = false;

  set userNameEmpty(value) {
    isUserNameEmpty = value;
    notifyListeners();
  }

  set noHandPhoneEmpty(value) {
    isNoHandphoneEmpty = value;
    notifyListeners();
  }

  set emailEmpty(value) {
    isEmailEmpty = value;
    notifyListeners();
  }

  set passwordEmpty(value) {
    isPasswordEmpty = value;
    notifyListeners();
  }

  set repasswordEmpty(value) {
    isRePasswordEmpty = value;
    notifyListeners();
  }

  bool get getUserNameIsEmpty => isUserNameEmpty;
  bool get getNoHandphoneIsEmpty => isNoHandphoneEmpty;
  bool get getEmailIsEmpty => isEmailEmpty;
  bool get getUPasswordIsEmpty => isPasswordEmpty;
  bool get getRePasswordIsEmpty => isRePasswordEmpty;

  bool obsecureTextPassword = true;
  bool obsecureTextRePassword = true;

  get getObsecureTextPasswword => obsecureTextPassword;

  set setObsecureTextPassword(value) {
    obsecureTextPassword = value;
    notifyListeners();
  }

  get getObsecureTextRePasswword => obsecureTextRePassword;

  set setObsecureTextRePassword(value) {
    obsecureTextRePassword = value;
    notifyListeners();
  }

  bool auth = false;
  bool get getAuth => auth;
  List _account = [
    {
      "userName": "admin",
      "password": "admin123",
      "email": "admin22996@gmail.com",
      "handphone": "081263987452",
    },
    {
      "userName": "admin2",
      "password": "admin1234",
      "email": "admin123@gmail.com",
      "handphone": "081234567890",
    }
  ];

  List get Account => _account;

  set ADDUSER(value) {
    _account.add(value);
    notifyListeners();
  }

  set Login(value) {
    for (var i = 0; i < _account.length; i++) {
      if (value["userName"] == _account[i]["userName"] &&
          value["password"] == _account[i]["password"]) {
        auth = true;
      }
    }

    notifyListeners();
  }
}
