import '../models/categories.dart';
import 'package:deen_pal/screens/prayer_times.dart';
import 'package:deen_pal/screens/quran_screen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import '../screens/hadith_cateegory_screen.dart';
import '../screens/newSuranScreen.dart';

class MyCategories extends StatelessWidget {
  MyCategories({super.key});

  final List<Categories> categories = [
    Categories(
      imagePath: 'assets/icons/quran.png',
      targetClass: const QuranScreen(),
      text: 'Quran',
    ),
    Categories(
        imagePath: 'assets/icons/mosque.png',
        targetClass: const PrayerTimesScreen(),
        text: 'Prayer Times'),
    Categories(
        imagePath: 'assets/icons/dua-hands.png',
        targetClass: const QuranScreen(),
        text: 'Supplication'),
    Categories(
        imagePath: 'assets/icons/praying.png',
        targetClass: const HadithCategoryScreen(),
        text: 'Hadtith'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: QuranPageScreen(pageNumber: 3,),
        text: 'Quran'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: const QuranScreen(),
        text: 'Quran'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: const QuranScreen(),
        text: 'Quran'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: const QuranScreen(),
        text: 'Quran'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        var category = categories[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => category.targetClass,
              ),
            );
          },
          child: Column(
            children: [
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: colors.tileColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  category.imagePath,
                  // height: 20,
                  scale: 15,
                  color: colors.secondaryColor,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                category.text,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: colors.fontColorLight,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
