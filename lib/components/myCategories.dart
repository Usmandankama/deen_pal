import '../models/categories.dart';
import 'package:deen_pal/screens/prayer_times_screen.dart';
import 'package:deen_pal/screens/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import '../screens/hadith_cateegory_screen.dart';

class MyCategories extends StatelessWidget {
  MyCategories({super.key});

  final List<Categories> categories = [
    Categories(
      imagePath: 'assets/icons/quran.png',
      targetClass: const QuranScreen(),
      text: 'Quran',
      subText: 'Read the glorious quran',
    ),
    Categories(
        imagePath: 'assets/icons/prayertime.png',
        targetClass: const PrayerTimesScreen(),
        subText: 'View the prayer times ',
        text: 'Prayer Times'),
    Categories(
        imagePath: 'assets/icons/dua-hands.png',
        targetClass: const QuranScreen(),
        subText: 'Learn supplications about everyday things',
        text: 'Supplication'),
    Categories(
        imagePath: 'assets/icons/book.png',
        targetClass: const HadithCategoryScreen(),
        subText: 'Read hadith from various collections',
        text: 'Hadtith'),
    Categories(
        imagePath: 'assets/icons/mosque.png',
        targetClass: const QuranScreen(),
        subText: 'Locate mosques around you',
        text: 'Mosque Locator'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: const QuranScreen(),
        subText: '',
        text: 'Quran'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            // Set the tile color
            tileColor: colors.tileColor,
            // Navigate to the Surah details page when a tile is tapped
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => category.targetClass,
                ),
              );
            },
            leading: Image.asset(
              category.imagePath,
              color: colors.secondaryColor,
              scale: 15,
            ),
            title: Text(
              category.text,
              style: TextStyle(
                fontSize: 20,
                color: colors.fontColorLight,
              ),
            ),
            subtitle: Text(
              category.subText,
              style: TextStyle(
                fontSize: 13,
                color: colors.fontColorLight,
              ),
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: colors.fontColorLight,
            ),
            // Display the Surah name in Arabic
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
