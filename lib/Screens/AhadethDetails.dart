import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Screens/Ahadeth.dart';
import 'package:islami/Screens/QuranDetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/AhadethArguments.dart';
import 'package:islami/utils/SuraArguments.dart';
import 'package:islami/utils/ThemePro.dart';
import 'package:provider/provider.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = "ahadethdetails";

  const AhadethDetails({super.key});

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  late AhadethArguments args;
  late ThemeProvider tpro;

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as AhadethArguments;
    tpro = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(tpro.mainbackground))),
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
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.fromLTRB(8, 12, 8, 8),
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
        leading: BackButton(color: tpro.BackButtonColor),
        title: Text(args.title),
      );
}
