import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/Screens/ahadethdetails.dart';
import 'package:islami/Screens/home.dart';
import 'package:islami/Screens/qurandetails.dart';
import 'package:islami/Screens/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/langprovider.dart';
import 'package:islami/utils/themepro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => themeprovider(),
    child: ChangeNotifierProvider(
        create: (context) => langProviders(), child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    langProviders langpro = Provider.of(context);
    themeprovider tpro = Provider.of(context);
    return MaterialApp(
      theme: AppStyle.Lighttheme,
      darkTheme: AppStyle.darktheme,
      themeMode: tpro.currenttheme,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("ar")],
      locale: Locale(langpro.selectedlanguage),
      debugShowCheckedModeBanner: false,
      routes: {
        splashscreen.routeName: (_) => splashscreen(),
        home.routeName: (_) => home(),
        qurandetails.routeName: (_) => qurandetails(),
        ahadethdetails.routeName: (_) => ahadethdetails()
      },
      initialRoute: splashscreen.routeName,
    );
  }
}
