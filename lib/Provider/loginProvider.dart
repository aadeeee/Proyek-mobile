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


  bool _obsecureText = true;

  get getObsecureText => _obsecureText;

  set setObsecureText(value){
    _obsecureText = value;
    notifyListeners();
  }
  

  // UserModel? user;

  // void register(bool username, bool password) {
  //   user = UserModel(username: username, password: password);
  //   notifyListeners();
  // }

  // bool login(String username, String password) {

  //   if (user != null && user!.username == username && user!.password == password) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  
}

class UserModel{
  bool? username;
  bool? password;
  UserModel({this.username, this.password});
}

