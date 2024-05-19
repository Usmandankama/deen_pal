import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class PrayerTimes extends StatefulWidget {
  const PrayerTimes({super.key});

  @override
  State<PrayerTimes> createState() => _PrayerTimesState();
}

class _PrayerTimesState extends State<PrayerTimes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentColor,
      appBar: AppBar(
        backgroundColor: colors.primaryColor,
        foregroundColor: colors.fontColorDark,
        elevation: 0,
        title: const Text(
          'Prayer TImes',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: colors.primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            width: 500,
            height: 150,
          ),
          // const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: colors.tileColor,
              title: Text(
                'Subhi',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontSize: 18,
                ),
              ),
              leading: Image.asset('assets/icons/sunrise.png', scale: 15),
              trailing: Text(
                '12:00 am',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: colors.tileColor,
              title: Text(
                'Subhi',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontSize: 18,
                ),
              ),
              leading: Image.asset('assets/icons/sun.png', scale: 15),
              trailing: Text(
                '12:00 am',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: colors.tileColor,
              title: Text(
                'Subhi',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontSize: 18,
                ),
              ),
              leading: Image.asset('assets/icons/sun.png', scale: 15),
              trailing: Text(
                '12:00 am',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: colors.tileColor,
              title: Text(
                'Subhi',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontSize: 18,
                ),
              ),
              leading: Image.asset('assets/icons/sunset.png', scale: 15),
              trailing: Text(
                '12:00 am',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: colors.tileColor,
              title: Text(
                'Subhi',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontSize: 18,
                ),
              ),
              leading: Image.asset('assets/icons/night.png', scale: 15),
              trailing: Text(
                '12:00 am',
                style: TextStyle(
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
