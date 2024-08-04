import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Screens/AhadethDetails.dart';
import 'package:islami/Screens/QuranDetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/AhadethArguments.dart';
import 'package:islami/utils/Constants.dart';
import 'package:islami/utils/SuraArguments.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<AhadethArguments> ahadethlist = [];

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
                          style: Theme.of(context).textTheme.displayMedium)),
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

  Divider buildDivider() =>
      const Divider(color: AppColor.primarycolor, thickness: 3);

  Expanded buildListview() => Expanded(
      flex: 7,
      child: ListView.builder(
          itemCount: ahadethlist.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, AhadethDetails.routeName,
                    arguments: ahadethlist[index]);
              },
              child: Row(
                children: [
                  Expanded(
                      child: Text(ahadethlist[index].title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium)),
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
          .add(AhadethArguments(title: hadethname, content: hadethcontent));
      setState(() {});
    }
  }
}
