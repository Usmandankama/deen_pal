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
  List<dynamic> sahihMuslim = [];
  List<dynamic> fourtyHadith = [];
  List<dynamic> riyaduSahiheen = [];
  late int itemIndex;
  List<String> jsonPath = [
    'assets/data/fourty-hadith.json',
    'assets/data/riyadu-saliheen.json',
    'assets/data/sahihul-muslim.json',
  ];
  List<HadithBooks> hadithbooks = [
    HadithBooks(
      authorArabic: 'الإمام مسلم بن الحجاي',
      authorEnglish: 'Imam Muslim ibn al-Hajjaj al-Naysaburi',
      lenght: '91',
      titleArabic: "صحيح مسلم",
      titleEnglish: "Sahih Muslim",
      // hadithContent: newsahihMuslim
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
  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  void readJsonData() async {
    final String firstResponse =
        await rootBundle.loadString('assets/data/sahihul-muslim.json');
    final firstData = await json.decode(firstResponse);
    final String secondResponse =
        await rootBundle.loadString('assets/data/fourty-hadith.json');
    final secondData = await json.decode(secondResponse);
    final String thirdResponse =
        await rootBundle.loadString('assets/data/riyadu-saliheen.json');
    final thirdData = await json.decode(thirdResponse);
    setState(() {
      sahihMuslim = firstData['hadiths'];
      fourtyHadith = secondData['hadiths'];
      riyaduSahiheen = thirdData['hadiths'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: hadithbooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        itemIndex = index;
        final hadithBook = hadithbooks[index];
        return GestureDetector(
          onTap: () {
            if (index == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HadithScreen(hadithContent: sahihMuslim, hadithName: 'Sahih Muslim'),
                ),
              );
            } else if(index == 1){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HadithScreen(hadithContent: fourtyHadith,hadithName: 'The Forty Hadith'),
                ),
              );
            }else{
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HadithScreen(hadithContent: riyaduSahiheen, hadithName: 'Riyad as-salihin'),
                ),
              );
            }
          },
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
}
