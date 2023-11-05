import 'package:flutter/material.dart';
import 'package:islami_route/models/ahadeth_model.dart';
import 'package:provider/provider.dart';

import '../my-themedata.dart';
import '../providers/my_provider.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = 'AhadethDetails';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(provider.theme == ThemeMode.light
              ? 'assets/images/background.png'
              : 'assets/images/darkback.png'),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            args.title!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        body: Card(
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: const BorderSide(color: MyThemeData.primaryColor)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    args.content[index],
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: args.content.length,
            ),
          ),
        ),
      ),
    );
  }
}
