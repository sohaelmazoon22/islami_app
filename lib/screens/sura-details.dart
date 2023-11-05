import 'package:flutter/material.dart';
import 'package:islami_route/my-themedata.dart';
import 'package:islami_route/models/sura_model.dart';
import 'package:islami_route/providers/sura-details-provider.dart';
import 'package:provider/provider.dart';
import '../providers/my_provider.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'SuraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    var myProvider = Provider.of<MyProvider>(context);

    return ChangeNotifierProvider(
        create: (create) => SuraDetailsProvider()..loadFiles(args.index!),
        builder: (context, child) {
          var suraProvider = Provider.of<SuraDetailsProvider>(context);
          return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(myProvider.theme == ThemeMode.light
                      ? 'assets/images/background.png'
                      : 'assets/images/darkback.png'),
                ),
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
                      borderSide:
                          const BorderSide(color: MyThemeData.primaryColor)),
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(
                        thickness: 1,
                        color: MyThemeData.primaryColor,
                        indent: 40,
                        endIndent: 40,
                      ),
                      itemBuilder: (context, index) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            "${suraProvider.verses[index]}(${index + 1})",
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                      itemCount: suraProvider.verses.length,
                    ),
                  ),
                ),
              ));
        });
  }
}
