import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_route/providers/ahadeth-details-provider.dart';
import 'package:islami_route/screens/ahadeth-details.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my-themedata.dart';

class AhadethTap extends StatefulWidget {
  @override
  State<AhadethTap> createState() => _AhadethTapState();
}

class _AhadethTapState extends State<AhadethTap> {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (create) => AhadethDetailsProvider()..loadHadeth(),
      builder: (context, child){
        var ahadethProvider = Provider.of<AhadethDetailsProvider>(context);
        return Center(
          child: Column(
            children: [
              Image.asset('assets/images/ahadeth_image.png'),
              const Divider(
                thickness: 2,
                color: MyThemeData.primaryColor,
              ),
              Text(AppLocalizations.of(context)!.ahadeth,
                  style: Theme.of(context).textTheme.bodyLarge),
              const Divider(
                thickness: 2,
                color: MyThemeData.primaryColor,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 1,
                    color: MyThemeData.primaryColor,
                    endIndent: 40,
                    indent: 40,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AhadethDetails.routeName,
                            arguments: ahadethProvider.allAhadeth[index]);
                      },
                      child: Text(
                        ahadethProvider.allAhadeth[index].title,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  },
                  itemCount: ahadethProvider.allAhadeth.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
