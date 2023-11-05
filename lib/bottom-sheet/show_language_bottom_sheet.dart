import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:islami_route/my-themedata.dart';
import 'package:islami_route/providers/my_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              provider.changeLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.english,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.local == 'en'
                            ? MyThemeData.primary
                            : MyThemeData.black,
                      ),
                ),
                provider.local == 'en'
                    ? const Icon(Icons.done,
                        size: 35, color: MyThemeData.primary)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: provider.local == 'ar'
                            ? MyThemeData.primary
                            : MyThemeData.black,
                      ),
                ),
                provider.local == 'ar'
                    ? const Icon(Icons.done,
                        size: 35, color: MyThemeData.primary)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
