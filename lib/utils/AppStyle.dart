import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/utils/AppColor.dart';

abstract class AppStyle{

  static const TextStyle appbartextStyle=TextStyle(color: AppColor.accent,fontSize: 30,fontWeight: FontWeight.bold);
  static const TextStyle screentitle=TextStyle(color: AppColor.accent,fontSize: 25,fontWeight: FontWeight.w600);

  static ThemeData Lighttheme = ThemeData(
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: appbartextStyle),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColor.primarycolor,
      textTheme: const TextTheme(
          displayLarge: appbartextStyle, displayMedium: screentitle),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColor.accent,
          unselectedItemColor: Colors.white));

  static ThemeData darktheme = ThemeData(
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          titleTextStyle: appbartextStyle.copyWith(color: Colors.white)),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColor.darkprimary,
      textTheme: TextTheme(
          displayLarge: appbartextStyle,
          displayMedium: screentitle.copyWith(color: Colors.white)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          selectedItemColor: AppColor.accentdark,
          unselectedItemColor: Colors.white));
}