import 'package:flutter/material.dart';
import 'package:islami_route/models/ahadeth_model.dart';

import '../my-themedata.dart';

class AhadethDetails extends StatefulWidget {
  static const String routeName = 'AhadethDetails';

  @override
  State<AhadethDetails> createState() => _AhadethDetailsState();
}

class _AhadethDetailsState extends State<AhadethDetails> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as AhadethModel;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/background.png'),
            fit: BoxFit.fill),
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
              borderSide: const BorderSide(color: MyThemeData.primary)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    args.content[index],
                    textAlign: TextAlign.center,
                  ),
                );
              },
              itemCount: args.content.length ,
            ),
          ),
        ),
      ),
    );
  }
}
