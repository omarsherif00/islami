import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/suraarguments.dart';

import '../utils/AppAssets.dart';

class qurandetails extends StatefulWidget {
  static const String routeName = "qurandetails";

  qurandetails({super.key});

  @override
  State<qurandetails> createState() => _qurandetailsState();
}

class _qurandetailsState extends State<qurandetails> {
  late suraarguments args;

  String filecontent = "";

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as suraarguments;

    if (filecontent.isEmpty) {
      readfile();
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.bg))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: buildappbar(),
        body: filecontent.isEmpty
            ? Center(child: buildCircularProgressIndicator())
            : buildContainer(),
      ),
    );
  }

  CircularProgressIndicator buildCircularProgressIndicator() {
    return CircularProgressIndicator(color: AppColor.primarycolor);
  }

  Widget buildContainer() {
    return Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.height * .7,
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.fromLTRB(8, 12, 8, 8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(25)),
        child: SingleChildScrollView(
            child: Text(
          filecontent,
          textDirection: TextDirection.rtl,
          style: AppStyle.screentitle.copyWith(fontSize: 16),
          textAlign: TextAlign.center,
        )));
  }

  AppBar buildappbar() => AppBar(
        leading: BackButton(color: Colors.black),
        title: Text("${args.suraname}", style: AppStyle.appbartextStyle),
        backgroundColor: AppColor.transparent,
        elevation: 0,
        centerTitle: true,
      );

  Future readfile() async {
    filecontent = await rootBundle.loadString("assets/suras/${args.filename}");

    List<String> Filelines = filecontent.split("\n");

    Filelines = Filelines.where((line) => line.trim().isNotEmpty).toList();
    for (int i = 0; i < Filelines.length; i++) {
      Filelines[i] += "(${i + 1})";
    }
    filecontent = Filelines.join();

    setState(() {});
  }
}
