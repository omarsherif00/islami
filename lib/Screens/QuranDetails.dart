import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/SuraArguments.dart';
import 'package:islami/utils/ThemePro.dart';
import 'package:provider/provider.dart';

import '../utils/AppAssets.dart';

class QuranDetails extends StatefulWidget {
  static const String routeName = "qurandetails";

  const QuranDetails({super.key});

  @override
  State<QuranDetails> createState() => _QuranDetailsState();
}

class _QuranDetailsState extends State<QuranDetails> {
  late SuraArguments args;
  late ThemeProvider tpro;
  String filecontent = "";

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SuraArguments;
    tpro = Provider.of(context);

    if (filecontent.isEmpty) {
      readfile();
    }

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(tpro.mainbackground))),
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
    return const CircularProgressIndicator(color: AppColor.primarycolor);
  }

  Widget buildContainer() {
    return Container(
        height: MediaQuery.of(context).size.height * .8,
        width: MediaQuery.of(context).size.height * .7,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 12, 8, 8),
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
        leading: BackButton(color: tpro.BackButtonColor),
        title: Text(args.suraname),
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
