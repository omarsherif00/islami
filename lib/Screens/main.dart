import 'package:flutter/material.dart';
import 'package:islami/Screens/home.dart';
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
      routes: {
        splashscreen.routeName:(_)=>const splashscreen(),
        home.routeName:(_)=>const home()
      },
      initialRoute: splashscreen.routeName,
    );
  }
}
