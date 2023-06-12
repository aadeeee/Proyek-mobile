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

  bool _obsecureText = true;

  get getObsecureText => _obsecureText;

  set setObsecureText(value){
    _obsecureText = value;
    notifyListeners();
  }

  
}
