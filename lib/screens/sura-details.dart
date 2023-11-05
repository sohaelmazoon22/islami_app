import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:islami_route/my-themedata.dart';
import 'package:islami_route/models/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    if (verses.isEmpty) {
      loadFiles(args.index!);
    }
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              args.name!,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          body: Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: MyThemeData.primary)),
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                  color: MyThemeData.primary,
                  indent: 40,
                  endIndent: 40,
                ),
                itemBuilder: (context, index) {
                  return Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      "${verses[index]}(${index + 1})",
                      textAlign: TextAlign.center,
                    ),
                  );
                },
                itemCount: verses.length,
              ),
            ),
          ),
        ));
  }

  void loadFiles(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1 }.txt');
    List<String> lines = sura.split('\n');
    verses = lines;
    setState(() {});
  }
}
