import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:islami_route/my-themedata.dart';
import 'package:islami_route/providers/my_provider.dart';
import 'package:provider/provider.dart';

class ThemingBottomSheet extends StatelessWidget {
  const ThemingBottomSheet({super.key});

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
              provider.changeTheme(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.light,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: provider.theme == ThemeMode.light
                        ? MyThemeData.primaryColor
                        : Colors.white,
                  ),
                ),
                provider.theme == ThemeMode.light
                    ? const Icon(Icons.done,
                    size: 35, color: MyThemeData.primaryColor)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              provider.changeTheme(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.dark,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: provider.theme == ThemeMode.dark
                        ? MyThemeData.yellowColor
                        : MyThemeData.black,
                  ),
                ),
                provider.theme == ThemeMode.dark
                    ? const Icon(Icons.done,
                    size: 35, color: MyThemeData.yellowColor)
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
