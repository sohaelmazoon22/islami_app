//
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class SettingProvider extends ChangeNotifier {
//   String currentlocal = "en";
//   ThemeMode cuurrentTheme = ThemeMode.light;
//   static SharedPreferences? prefs;
//
//
//   changeCurrentLocal(String newlocal) {
//     currentlocal = newlocal;
//     prefs?.setString('lang', currentlocal);
//     notifyListeners();
//   }
//   getLocal(){
//     String lang = prefs?.getString('lang')??'ar';
//     currentlocal = lang;
//     print(lang);
//   }
//
//   changeCurrentTheme(ThemeMode newtheme) {
//
//     cuurrentTheme = newtheme;
//     if(newtheme == ThemeMode.light ){
//       prefs?.setString('themee', 'light');
//     }
//     else{
//       prefs?.setString('themee', 'dark');
//     }
//
//     notifyListeners();
//   }
//
//   getTheme()
//   {
//     String themee = prefs?.getString('themee')??'light';
//     if(themee == 'light'){
//       cuurrentTheme = ThemeMode.light;
//     }
//     else{
//       cuurrentTheme = ThemeMode.dark;
//     }
//
//   }
//
// }