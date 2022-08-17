import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  bool isTheme = false;
  void changeTheme(bool value){
    isTheme = value;
    notifyListeners();

  }
}
