import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class PrayerTile extends StatelessWidget {
  String text, pryarTime, imagePath;
  PrayerTile({
    super.key,
    required this.text,
    required this.imagePath,
    required this.pryarTime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: ListTile(
            title: Text(
              text,
              style: TextStyle(
                color: colors.fontColorDark,
                fontSize: 18,
              ),
            ),
            leading: Image.asset(imagePath, scale: 15),
            trailing: Text(
              // times['isha'],
              pryarTime,
              style: TextStyle(
                color: colors.fontColorDark,
                fontFamily: 'Poppins',
                fontSize: 20,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Divider(
          color: colors.accentColor,
          height: 3,
          thickness: .2,
        ),
      ],
    );
  }
}
