import 'package:flutter/material.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/extension.dart';
import 'package:islami/utils/langprovider.dart';
import 'package:islami/utils/themepro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late final String? language;
  late final bool? mode;
  late langProviders pro;
  late themeprovider tpro;

  @override
  Widget build(BuildContext context) {
    pro = Provider.of(context);
    tpro = Provider.of(context);

    return Column(
      children: [
        SizedBox(
          height: 55,
        ),
        Text(context.applocalization.language,
            style: Theme.of(context).textTheme.displayMedium),
        Container(
          child: BuilddropdownMenu(),
          width: double.infinity,
        ),
        SizedBox(
          height: 55,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.applocalization.theme,
                style: Theme.of(context).textTheme.displayMedium),
            SizedBox(
              width: 30,
            ),
            BuildSwitch()
          ],
        )
      ],
    );
  }

  BuilddropdownMenu() => DropdownButton(
      value: pro.selectedlanguage,
      items: [
        DropdownMenuItem(
            value: "ar",
            child: Text(
              "العربيه",
              style:
                  AppStyle.screentitle.copyWith(fontWeight: FontWeight.normal),
            )),
        DropdownMenuItem(
            value: "en",
            child: Text(
              "english",
              style: AppStyle.appbartextStyle
                  .copyWith(fontWeight: FontWeight.normal),
            ))
      ],
      isExpanded: true,
      onChanged: (newvalue) {
        language = pro.selectedlanguage;
        pro.setlang = newvalue ?? pro.selectedlanguage;
        savedata();
        setState(() {});
      });

  BuildSwitch() => Switch(
      activeColor: AppColor.primarycolor,
      value: tpro.isdarkthemedenabled,
      onChanged: (newvalue) {
        tpro.ctheme = newvalue ? ThemeMode.dark : ThemeMode.light;
        savedata();
        setState(() {});
      });

  Future savedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("DarkMode", tpro.isdarkthemedenabled);
    await prefs.setString("lang", pro.selectedlanguage);

    language = prefs.getString("lang");
    mode = prefs.getBool("lang");
  }
}
