import 'dart:convert';
import 'package:deen_pal/models/hadith_books.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:flutter/services.dart';

import '../models/hadith.dart';
import '../screens/hadith_screen.dart';

class HadithCategories extends StatefulWidget {
  const HadithCategories({super.key});

  @override
  State<HadithCategories> createState() => _HadithCategoriesState();
}

class _HadithCategoriesState extends State<HadithCategories> {
  final List<String> jsonPaths = [
    'assets/data/fourty-hadith.json',
    'assets/data/riyadu-saliheen.json',
    'assets/data/sahihul-muslim.json',
  ];

  final List<HadithBooks> hadithBooks = [
    HadithBooks(
      authorArabic: 'الإمام مسلم بن الحجاي',
      authorEnglish: 'Imam Muslim ibn al-Hajjaj al-Naysaburi',
      lenght: '91',
      titleArabic: "صحيح مسلم",
      titleEnglish: "Sahih Muslim",
    ),
    HadithBooks(
      authorArabic: "الإمام يحيى بن شرف النووي",
      authorEnglish: "Imam Yahya ibn Sharaf al-Nawawi",
      lenght: '42',
      titleArabic: "الأربعون النووية",
      titleEnglish: "The Forty Hadith",
    ),
    HadithBooks(
      authorArabic: "الإمام يحيى بن شرف النووي",
      authorEnglish: "Imam Yahya ibn Sharaf al-Nawawi",
      lenght: '679',
      titleArabic: "رياض الصالحين",
      titleEnglish: "Riyad as-Salihin",
    ),
  ];

  Future<List<List<dynamic>>> _loadJsonData() async {
    final List<List<dynamic>> hadithData = [];
    for (final path in jsonPaths) {
      final String response = await rootBundle.loadString(path);
      final data = json.decode(response);
      hadithData.add(data['hadiths']);
    }
    return hadithData;
  }

  void _navigateToHadithScreen(BuildContext context, int index, List<List<dynamic>> hadithData) {
    final screens = [
      HadithScreen(hadithContent: hadithData[2], hadithName: 'Sahih Muslim'),
      HadithScreen(hadithContent: hadithData[0], hadithName: 'The Forty Hadith'),
      HadithScreen(hadithContent: hadithData[1], hadithName: 'Riyad as-Salihin'),
    ];

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<List<dynamic>>>(
      future: _loadJsonData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data'));
        } else {
          final hadithData = snapshot.data!;
          return GridView.builder(
            itemCount: hadithBooks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final hadithBook = hadithBooks[index];
              return GestureDetector(
                onTap: () => _navigateToHadithScreen(context, index, hadithData),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: colors.tileColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black.withOpacity(.2),
                        offset: const Offset(1, 3),
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
                      child: Column(
                        children: [
                          Text(
                            hadithBook.titleEnglish,
                            style: TextStyle(
                              color: colors.fontColorLight,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            hadithBook.titleArabic,
                            style: TextStyle(
                              color: colors.fontColorLight,
                              fontSize: 15,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.my_library_books_rounded,
                                color: colors.fontColorLight,
                                size: 17,
                              ),
                              Text(
                                '${hadithBook.lenght} hadiths',
                                style: TextStyle(
                                  color: colors.fontColorLight,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
