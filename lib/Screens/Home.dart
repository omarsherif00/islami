import 'package:flutter/material.dart';
import 'package:islami/Screens/Ahadeth.dart';
import 'package:islami/Screens/MyRadio.dart';
import 'package:islami/Screens/Quran.dart';
import 'package:islami/Screens/Sebha.dart';
import 'package:islami/Screens/Settings.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/Extension.dart';
import 'package:islami/utils/ThemePro.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName="home";

  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> tabs = [Quran(), Ahadeth(), MyRadio(), Sebha(), Settings()];
  int selectedtabindex = 0;
  @override
  Widget build(BuildContext context) {
    ThemeProvider tpro = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(tpro.mainbackground))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildappbar(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: tpro.bottomtheme),
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
            icon: ImageIcon(AssetImage(AppAssets.quran)),
            label: context.applocalization.quran),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.openqu)),
            label: context.applocalization.hadeeth),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.radio)),
            label: context.applocalization.radio),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage(AppAssets.sebha)),
            label: context.applocalization.sebha),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings), label: context.applocalization.settings)
      ],
      selectedIconTheme: IconThemeData(
        size: 36,
      ),
    );
  }

  AppBar buildappbar() => AppBar(
        title: Text(context.applocalization.islami),
      );
}
