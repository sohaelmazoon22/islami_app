import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami_route/providers/my_provider.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my-themedata.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int x = 0;
  double turn = 0.0;
  List<String> azkar = [
    'سبحان الله',
    'الحمد الله',
    'لا اله الا الله',
    'الله أكبر'
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 1, 1, 180),
                  child: Image.asset(
                    provider.theme == ThemeMode.light
                        ? 'assets/images/head_of_seb7a.png'
                        : 'assets/images/dark_head_of_seb7a.png',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(1, 100, 1, 1),
                  child: AnimatedRotation(
                    turns: turn,
                    duration: const Duration(seconds: 1),
                    child: Image.asset(provider.theme == ThemeMode.light
                        ? 'assets/images/body_of_seb7a.png'
                        : 'assets/images/dark_body_of_seb7a.png'),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(1, 10, 1, 1),
              child: Text(
                AppLocalizations.of(context)!.numberOfAltaspihat,
                style: GoogleFonts.elMessiri(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: provider.theme == ThemeMode.light
                        ? const Color(0xff242424)
                        : Colors.white),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(1, 5, 1, 10),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                decoration: BoxDecoration(
                  color: provider.theme == ThemeMode.light
                      ? MyThemeData.secondaryColor
                      : MyThemeData.primaryColorDark,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  ' $counter ',
                  style: Theme.of(context).textTheme.displaySmall,
                )),
            ElevatedButton(
              onPressed: () {
                if (counter < 33) {
                  counter++;
                } else {
                  counter = 0;
                  if (x < 3) {
                    x++;
                  } else {
                    x = 0;
                  }
                }
                setState(() {
                  turn += 1 / 32;
                });
              },
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(0.0),
                backgroundColor: MaterialStatePropertyAll(
                    provider.theme == ThemeMode.light
                        ? MyThemeData.secondaryColor
                        : MyThemeData.secondaryColorDark),
                padding: const MaterialStatePropertyAll(
                    EdgeInsets.fromLTRB(20, 8, 20, 8)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Text(azkar[x],
                  style: GoogleFonts.elMessiri(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff242424))),
            ),
            const SizedBox(
              height: 5,
            )
          ],
        ),
      ),
    );
  }
}
