import 'package:flutter/material.dart';
import 'package:islami/Screens/qurandetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/constants.dart';
import 'package:islami/utils/extension.dart';
import 'package:islami/utils/suraarguments.dart';

class quran extends StatelessWidget {
  const quran({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.mainlogo)),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  buildDivider(),
                  Row(
                    children: [
                      Expanded(
                          child: Text(context.applocalization.sura,
                              textAlign: TextAlign.center,
                              style:
                                  Theme.of(context).textTheme.displayMedium)),
                      Expanded(
                          child: Text(context.applocalization.verses,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayMedium))
                    ],
                  ),
                  buildDivider(),
                  buildListview()
                ],
              ),
              VerticalDivider(
                thickness: 3,
                color: AppColor.primarycolor,
                indent: 10,
              )
            ],
          ),
        )
      ],
    );
  }

  Expanded buildListview() => Expanded(
      flex: 7,
      child: ListView.builder(
          itemCount: constants.suraNames.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, qurandetails.routeName,
                    arguments: suraarguments(
                        filename: "${index + 1}.txt",
                        suraname: constants.suraNames[index]));
              },
              child: Row(
                children: [
                  Expanded(
                      child: Text(constants.suraNames[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium)),
                  Expanded(
                      child: Text(constants.versesNumber[index].toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium))
                ],
              ),
            );
          }));

  Divider buildDivider() => Divider(color: AppColor.primarycolor, thickness: 3);
}
