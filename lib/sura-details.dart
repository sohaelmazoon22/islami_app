import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route/sura_model.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

List<String> verses = [];

class _SuraDetailsState extends State<SuraDetails> {
  @override
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(verses[index]);
          },
          itemCount: verses.length,
        ),
      ),
    );
  }

  Future<void> loadFiles(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> lines = sura.split('\n');
    verses = lines;
    setState(() {});

  }
}
