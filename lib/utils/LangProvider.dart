import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LangProviders extends ChangeNotifier {
  String selectedlanguage = "ar";

  set setlang(String newlang) {
    selectedlanguage = newlang;
    notifyListeners();
  }

  Future<void> LoadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String selectedLanguagepref = prefs.getString('lang') ?? "ar";
    setlang = selectedLanguagepref;
  }
}
