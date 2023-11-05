import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/my_provider.dart';

class RadioTap extends StatelessWidget {
  const RadioTap({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, bottom: 40),
            child: Image.asset('assets/images/radio_image.png'),
          ),
          Text(
            'إذاعة القرآن الكريم',
            style: GoogleFonts.elMessiri(
                fontSize: 30,
                fontWeight: FontWeight.w500,
                color: provider.theme == ThemeMode.light
                    ? const Color(0xff242424)
                    : Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Image.asset(provider.theme == ThemeMode.light
                ? 'assets/images/play-tap.png'
                : 'assets/images/play-tap-dark.png'),
          ),
        ],
      ),
    );
  }
}
