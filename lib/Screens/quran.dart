import 'package:flutter/material.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/constants.dart';

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
                          child: Text("sura",
                              textAlign: TextAlign.center,
                              style: AppStyle.screentitle)),
                      Expanded(
                          child: Text("verses",
                              textAlign: TextAlign.center,
                              style: AppStyle.screentitle))
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
            return Row(
              children: [
                Expanded(
                    child: Text(constants.suraNames[index],
                        textAlign: TextAlign.center,
                        style: AppStyle.screentitle)),
                Expanded(
                    child: Text(constants.versesNumber[index].toString(),
                        textAlign: TextAlign.center,
                        style: AppStyle.screentitle))
              ],
            );
          }));

  Divider buildDivider() => Divider(color: AppColor.primarycolor, thickness: 3);
}
