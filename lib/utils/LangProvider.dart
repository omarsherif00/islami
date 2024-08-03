import 'package:flutter/cupertino.dart';

class LangProviders extends ChangeNotifier {
  String selectedlanguage = "ar";

  set setlang(String newlang) {
    selectedlanguage = newlang;
    notifyListeners();
  }
}
