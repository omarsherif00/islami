import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Screens/ahadethdetails.dart';
import 'package:islami/Screens/qurandetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/ahadetharguments.dart';
import 'package:islami/utils/constants.dart';
import 'package:islami/utils/suraarguments.dart';

class ahadeth extends StatefulWidget {
  ahadeth({super.key});

  @override
  State<ahadeth> createState() => _ahadethState();
}

class _ahadethState extends State<ahadeth> {
  List<ahadetharguments> ahadethlist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readfile();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.hadethllogo)),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              buildDivider(),
              Row(
                children: [
                  Expanded(
                      child: Text("الاحاديث",
                          textAlign: TextAlign.center,
                          style: AppStyle.screentitle)),
                ],
              ),
              buildDivider(),
              buildListview()
            ],
          ),
        ),
      ],
    );
  }

  Divider buildDivider() => Divider(color: AppColor.primarycolor, thickness: 3);

  Expanded buildListview() => Expanded(
      flex: 7,
      child: ListView.builder(
          itemCount: ahadethlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, ahadethdetails.routeName,
                    arguments: ahadethlist[index]);
              },
              child: Row(
                children: [
                  Expanded(
                      child: Text(ahadethlist[index].title,
                          textAlign: TextAlign.center,
                          style: AppStyle.screentitle)),
                ],
              ),
            );
          }));

  Future readfile() async {
    String filecontent =
        await rootBundle.loadString("assets/ahadeth/ahadeth.txt");

    List<String> hadethaslist = filecontent.split("#\r\n");
    for (int i = 0; i < hadethaslist.length; i++) {
      String hadeth = hadethaslist[i];
      List<String> lines = hadeth.split("\n");
      String hadethname = lines[0];
      lines.removeAt(0);
      String hadethcontent = lines.join();
      ahadethlist
          .add(ahadetharguments(title: hadethname, content: hadethcontent));
      setState(() {});
    }
  }
}
