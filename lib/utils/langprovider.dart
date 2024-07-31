import 'package:flutter/cupertino.dart';

class langProviders extends ChangeNotifier {
  String selectedlanguage = "ar";

  set setlang(String newlang) {
    selectedlanguage = newlang;
    notifyListeners();
  }
}
