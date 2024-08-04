import 'package:flutter/material.dart';
import 'package:islami/Screens/QuranDetails.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/Constants.dart';
import 'package:islami/utils/Extension.dart';
import 'package:islami/utils/SuraArguments.dart';

class Quran extends StatelessWidget {
  const Quran({super.key});

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
              const VerticalDivider(
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
          itemCount: Constants.suraNames.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, QuranDetails.routeName,
                    arguments: SuraArguments(
                        filename: "${index + 1}.txt",
                        suraname: Constants.suraNames[index]));
              },
              child: Row(
                children: [
                  Expanded(
                      child: Text(Constants.suraNames[index],
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium)),
                  Expanded(
                      child: Text(Constants.versesNumber[index].toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.displayMedium))
                ],
              ),
            );
          }));

  Divider buildDivider() =>
      const Divider(color: AppColor.primarycolor, thickness: 3);
}
