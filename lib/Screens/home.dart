import 'package:flutter/material.dart';
import 'package:islami/Screens/ahadeth.dart';
import 'package:islami/Screens/myRadio.dart';
import 'package:islami/Screens/quran.dart';
import 'package:islami/Screens/sebha.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/Screens/home.dart';

class home extends StatefulWidget {
  static const String routeName="home";

  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> tabs = [quran(), ahadeth(), myRadio(), sebha()];
  int selectedtabindex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.bg))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildappbar(),
        bottomNavigationBar: Theme(
          data: ThemeData(canvasColor: AppColor.primarycolor),
          child: buildBottomNavigationBar(),
        ),
        body: tabs[selectedtabindex],
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: selectedtabindex,
      onTap: (index) {
        setState(() {
          selectedtabindex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.quran)), label: "quran"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.openqu)), label: "ahadeth"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.radio)), label: "radio"),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.sebha)), label: "sebha"),
      ],
      selectedItemColor: AppColor.accent,
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
    );
  }

  AppBar buildappbar() => AppBar(
      title: Text("islami", style: AppStyle.appbartextStyle),
      backgroundColor: AppColor.transparent,
      elevation: 0,
      centerTitle: true);
}
