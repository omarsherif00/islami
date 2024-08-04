import 'package:flutter/material.dart';
import 'package:islami/utils/AppColor.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/Extension.dart';
import 'package:islami/utils/LangProvider.dart';
import 'package:islami/utils/ThemePro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late LangProviders pro;
  late ThemeProvider tpro;

  @override
  Widget build(BuildContext context) {
    pro = Provider.of(context);
    tpro = Provider.of(context);

    return Column(
      children: [
        const SizedBox(
          height: 55,
        ),
        Text(context.applocalization.language,
            style: Theme.of(context).textTheme.displayMedium),
        Container(
          child: BuilddropdownMenu(),
          width: double.infinity,
        ),
        const SizedBox(
          height: 55,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.applocalization.theme,
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(
              width: 30,
            ),
            BuildSwitch()
          ],
        )
      ],
    );
  }

  BuilddropdownMenu() => DropdownButton(
      dropdownColor: tpro.dropdownmenucolor,
      value: pro.selectedlanguage,
      items: [
        DropdownMenuItem(
            value: "ar",
            child: Text(
              "العربيه",
              style: Theme.of(context).textTheme.displayMedium)),
        DropdownMenuItem(
            value: "en",
            child: Text(
              "english",
              style: Theme.of(context).textTheme.displayMedium,
            ))
      ],
      isExpanded: true,
      onChanged: (newvalue) {
        pro.setlang = newvalue ?? pro.selectedlanguage;
        setState(() {});
        savedata();
      });

  BuildSwitch() => Switch(
      activeColor: AppColor.primarycolor,
      value: tpro.isdarkthemedenabled,
      onChanged: (newvalue) {
        tpro.ctheme = newvalue ? ThemeMode.dark : ThemeMode.light;
        setState(() {});
        savedata();
      });

  Future savedata() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("DarkMode", tpro.isdarkthemedenabled);
    await prefs.setString("lang", pro.selectedlanguage);
    print("${prefs.getBool("DarkMode")}");
  }
}
