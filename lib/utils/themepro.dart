import 'package:flutter/material.dart';
import 'package:islami/Screens/splash.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';

class themeprovider extends ChangeNotifier {
  Color get dropdownmenucolor =>
      isdarkthemedenabled ? AppColor.darkprimary : AppColor.primarycolor;

  ThemeMode currenttheme = ThemeMode.light;

  bool get isdarkthemedenabled => currenttheme == ThemeMode.dark;

  set ctheme(ThemeMode newtheme) {
    currenttheme = newtheme;
    notifyListeners();
  }

  String get Splashmode =>
      isdarkthemedenabled ? AppAssets.darksplash : AppAssets.lightsplash;

  String get mainbackground =>
      isdarkthemedenabled ? AppAssets.darkbg : AppAssets.lightbg;

  Color get bottomtheme =>
      isdarkthemedenabled ? AppColor.darkprimary : AppColor.primarycolor;
}
