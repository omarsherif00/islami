import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/Screens/AhadethDetails.dart';
import 'package:islami/Screens/Home.dart';
import 'package:islami/Screens/QuranDetails.dart';
import 'package:islami/Screens/Splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/utils/AppStyle.dart';
import 'package:islami/utils/LangProvider.dart';
import 'package:islami/utils/ThemePro.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeProvider mytheme = ThemeProvider();
  await mytheme.loadSavedData();
  runApp(ChangeNotifierProvider(
    create: (context) => mytheme,
    child: ChangeNotifierProvider(
        create: (context) => LangProviders(), child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LangProviders langpro = Provider.of(context);
    ThemeProvider tpro = Provider.of(context);
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
        SplashScreen.routeName: (_) => SplashScreen(),
        Home.routeName: (_) => Home(),
        QuranDetails.routeName: (_) => QuranDetails(),
        AhadethDetails.routeName: (_) => AhadethDetails()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
