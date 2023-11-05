import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/ahadeth_model.dart';

class AhadethDetailsProvider extends ChangeNotifier{
  List<AhadethModel> allAhadeth = [];
  loadHadeth() async {
    rootBundle.loadString('assets/files/ahadeth.txt').then((ahadeth) {
      List<String> ahadethList = ahadeth.split("#");
      for (int i = 0; i < ahadethList.length; i++) {
        String hadethOne = ahadethList[i];
        List<String> hadethOneLines = hadethOne.trim().split("\n");
        String title = hadethOneLines[0];
        hadethOneLines.removeAt(0);
        List<String> content = hadethOneLines;
        AhadethModel ahadethModel = AhadethModel(title, content);
        allAhadeth.add(ahadethModel);
        notifyListeners();
      }
    }).catchError((e) {
      print(e.toString());
    });
  }

}