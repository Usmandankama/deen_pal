// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class NextPrayer extends StatefulWidget {
  const NextPrayer({super.key});

  @override
  State<NextPrayer> createState() => _NextPrayerState();
}

class _NextPrayerState extends State<NextPrayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: colors.tileColor, borderRadius: BorderRadius.circular(20)),
      height: 200,
      width: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            'Next Prayer',
            style: TextStyle(
              color: colors.secondaryColor,
              fontSize: 25,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            'Asr: 12:00',
            style: TextStyle(
              color: colors.fontColorLight,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 5),
          Text(
            '00:1:45 left till Isha',
            style: TextStyle(
              color: colors.fontColorLight,
              fontSize: 20,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
