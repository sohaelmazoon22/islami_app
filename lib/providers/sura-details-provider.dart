import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class SuraDetailsProvider extends ChangeNotifier {
  List<String> verses = [];
  void loadFiles(int index) async {
    try {
      String sura =
          await rootBundle.loadString('assets/files/${index + 1}.txt');
      List<String> lines = sura.split('\n');
      verses = lines;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
