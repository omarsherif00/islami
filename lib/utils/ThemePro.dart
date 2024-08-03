import 'package:flutter/material.dart';
import 'package:islami/Screens/Splash.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  Color get dropdownmenucolor =>
      isdarkthemedenabled ? AppColor.darkprimary : AppColor.primarycolor;

  ThemeMode currenttheme = ThemeMode.light;

  bool get isdarkthemedenabled => currenttheme == ThemeMode.dark;

  set ctheme(ThemeMode newtheme) {
    currenttheme = newtheme;
    notifyListeners();
  }

  Color get BackButtonColor =>
      isdarkthemedenabled ? Colors.white : Colors.black;

  String get Splashmode =>
      isdarkthemedenabled ? AppAssets.darksplash : AppAssets.lightsplash;

  String get mainbackground =>
      isdarkthemedenabled ? AppAssets.darkbg : AppAssets.lightbg;

  Color get bottomtheme =>
      isdarkthemedenabled ? AppColor.darkprimary : AppColor.primarycolor;

  Future<void> loadSavedData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool('DarkMode') ?? false;
    currenttheme = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    final String? selectedLanguage = prefs.getString('lang');
  }
}
