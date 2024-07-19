import 'package:flutter/material.dart';
import 'package:islami/Screens/home.dart';
import 'package:islami/utils/AppAssets.dart';

class splashscreen extends StatefulWidget {
  static const String routeName="splash";
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:3),(){
    Navigator.pushReplacementNamed(context, home.routeName);

    });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(AppAssets.splash),
    );
  }
}
