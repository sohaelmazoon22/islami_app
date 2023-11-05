import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route/screens/ahadeth-details.dart';
import 'package:islami_route/models/ahadeth_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my-themedata.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  List<AhadethModel> allAhadeth = [];

  @override
  Widget build(BuildContext context) {
    if (allAhadeth.isEmpty) {
      loadHadeth();
    }
    return Center(
      child: Column(
        children: [
          Image.asset('assets/images/ahadeth_image.png'),
          const Divider(
            thickness: 2,
            color: MyThemeData.primary,
          ),
          Text(AppLocalizations.of(context)!.ahadeth, style: Theme.of(context).textTheme.bodyLarge),
          const Divider(
            thickness: 2,
            color: MyThemeData.primary,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: MyThemeData.primary,
                endIndent: 40,
                indent: 40,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AhadethDetails.routeName,
                        arguments: allAhadeth[index]);
                  },
                  child: Text(
                    allAhadeth[index].title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
              },
              itemCount: allAhadeth.length,
            ),
          ),
        ],
      ),
    );
  }

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
        setState(() {});
      }
    }).catchError((e) {
      print(e.toString());
    });
  }
}
