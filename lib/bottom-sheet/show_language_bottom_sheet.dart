import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:islami_route/my-themedata.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalizations.of(context)!.english,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: MyThemeData.primary,
                    ),
              ),
              const Icon(Icons.done, size: 35, color: MyThemeData.primary,),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.arabic,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: MyThemeData.black,
                  ),
                     ),
              const SizedBox.shrink(),
            ],
          ),
        ],
      ),
    );
  }
}
