import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class PrayerTile extends StatelessWidget {
  final String text;
  final String pryarTime;
  final String imagePath;

  const PrayerTile({
    Key? key,
    required this.text,
    required this.imagePath,
    required this.pryarTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            text,
            style: TextStyle(
              color: colors.fontColorDark,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Image.asset(
            imagePath,
            width: 32,
            height: 32,
          ),
          trailing: Text(
            pryarTime,
            style: TextStyle(
              color: colors.fontColorDark,
              fontFamily: 'Poppins',
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
