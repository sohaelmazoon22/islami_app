import 'package:flutter/material.dart';
import 'package:islami_route/screens/ahadeth-details.dart';
import 'package:islami_route/screens/home.dart';
import 'package:islami_route/my-themedata.dart';
import 'package:islami_route/screens/sura-details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        SuraDetails.routeName : (context) => SuraDetails(),
        AhadethDetails.routeName : (context) => AhadethDetails(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,

      );
  }
}
