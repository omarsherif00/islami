import 'package:flutter/material.dart';
import 'package:islami/Screens/ahadethdetails.dart';
import 'package:islami/Screens/home.dart';
import 'package:islami/Screens/qurandetails.dart';
import 'package:islami/Screens/splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        splashscreen.routeName: (_) => splashscreen(),
        home.routeName: (_) => home(),
        qurandetails.routeName: (_) => qurandetails(),
        ahadethdetails.routeName: (_) => ahadethdetails()
      },
      initialRoute: splashscreen.routeName,
    );
  }
}
