import 'package:flutter/material.dart';
import 'package:islami/Screens/ahadeth.dart';
import 'package:islami/Screens/myRadio.dart';
import 'package:islami/Screens/quran.dart';
import 'package:islami/Screens/sebha.dart';
import 'package:islami/Screens/settings.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/extension.dart';
import 'package:islami/utils/themepro.dart';
import 'package:provider/provider.dart';

class home extends StatefulWidget {
  static const String routeName="home";

  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> tabs = [quran(), ahadeth(), myRadio(), sebha(), Settings()];
  int selectedtabindex = 0;
  @override
  Widget build(BuildContext context) {
    themeprovider tpro = Provider.of(context);
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
