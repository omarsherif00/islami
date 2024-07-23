import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Screens/ahadeth.dart';
import 'package:islami/Screens/qurandetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/ahadetharguments.dart';
import 'package:islami/utils/suraarguments.dart';

class ahadethdetails extends StatefulWidget {
  static const String routeName = "ahadethdetails";

  ahadethdetails({super.key});

  @override
  State<ahadethdetails> createState() => _ahadethdetailsState();
}

class _ahadethdetailsState extends State<ahadethdetails> {
  late ahadetharguments args;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ahadetharguments;

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.bg))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildappbar(),
        body: buildContainer(),
      ),
    );
  }

  Widget buildContainer() {
    return Container(
        height: MediaQuery.of(context).size.height * .7,
        width: MediaQuery.of(context).size.height * .6,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.fromLTRB(8, 12, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: SingleChildScrollView(
            child: Text(
          args.content,
          textDirection: TextDirection.rtl,
          style: AppStyle.screentitle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        )));
  }

  AppBar buildappbar() => AppBar(
      title: Text(args.title, style: AppStyle.appbartextStyle),
      backgroundColor: AppColor.transparent,
      elevation: 0,
      centerTitle: true);
}
