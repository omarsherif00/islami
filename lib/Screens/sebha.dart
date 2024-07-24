import 'package:flutter/material.dart';
import 'package:islami/utils/AppAssets.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';

class sebha extends StatefulWidget {
  sebha({super.key});

  @override
  State<sebha> createState() => _sebhaState();
}

double turns = 0.0;
List<String> azkar = ["سبحان الله", "الحمدلله", "الله اكبر"];
//String zekr="سبحان الله";
int sebhacounter = 0;
int azkarcounter = 0;

class _sebhaState extends State<sebha> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Center(
        child: buildStack(),
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(70.0),
          child: buildColumn(),
        ),
        Image.asset(AppAssets.sebhatop),
      ],
    );
  }

  Column buildColumn() {
    return Column(
      children: [
        AnimatedRotation(
            turns: turns,
            duration: Duration(seconds: 1),
            child: Image.asset(AppAssets.sebhabody)),
        SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: AppColor.primarycolor,
          ),
          padding: EdgeInsets.all(40),
          child: Text("${sebhacounter}", style: AppStyle.screentitle),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(AppColor.primarycolor)),
            onPressed: () {
              onclick();
            },
            child: Text(azkar[azkarcounter]))
      ],
    );
  }

  void onclick() {
    return setState(() {
      sebhacounter++;
      if (sebhacounter >= 33) {
        updateazkar();
      }
      turns += 0.3 / 4;
    });
  }

  void updateazkar() {
    sebhacounter = 0;
    azkarcounter = (azkarcounter + 1) % azkar.length;
  }
}
