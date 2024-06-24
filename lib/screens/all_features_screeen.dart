import 'package:flutter/material.dart';
import '../models/categories.dart';
import 'hadith_cateegory_screen.dart';
import 'prayer_times_screen.dart';
import 'quran_screen.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class AllFeatures extends StatefulWidget {
  const AllFeatures({super.key});

  @override
  State<AllFeatures> createState() => _AllFeaturesState();
}

class _AllFeaturesState extends State<AllFeatures> {
  // caategories
  final List<Categories> categories = [
    Categories(
      imagePath: 'assets/icons/quran.png',
      targetClass: const QuranScreen(),
      text: 'Quran',
    ),
    Categories(
        imagePath: 'assets/icons/prayertime.png',
        targetClass: const PrayerTimesScreen(),
        text: 'Prayer Times'),
    Categories(
        imagePath: 'assets/icons/dua-hands.png',
        targetClass: const QuranScreen(),
        text: 'Supplication'),
    Categories(
        imagePath: 'assets/icons/book.png',
        targetClass: const HadithCategoryScreen(),
        text: 'Hadtith'),
    Categories(
        imagePath: 'assets/icons/mosque.png',
        targetClass: const QuranScreen(),
        text: 'Mosque Locator'),
    Categories(
        imagePath: 'assets/icons/quran.png',
        targetClass: const QuranScreen(),
        text: 'Quran'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        backgroundColor: colors.primaryColor,
        title: const Text(
          'Features',
          style: TextStyle(fontSize: 20, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 0,
            crossAxisCount: 2,
            childAspectRatio: 0.85,
          ),
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
                    height: 150,
                    width: 200,
                    decoration: BoxDecoration(
                      color: colors.tileColor,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(2, 5),
                          color: Color.fromARGB(78, 0, 0, 0),
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Image.asset(
                            category.imagePath,
                            scale: 7,
                            color: colors.secondaryColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            category.text,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Poppins',
                              color: colors.fontColorLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
