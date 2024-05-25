import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:deen_pal/models/hadith_books.dart';
import 'package:deen_pal/screens/chapters_screen.dart';

class HadithCategories extends StatefulWidget {
  const HadithCategories({super.key});

  @override
  State<HadithCategories> createState() => _HadithCategoriesState();
}

class _HadithCategoriesState extends State<HadithCategories> {
  final List<List<dynamic>> chapterData = [];
  final List<List<dynamic>> hadithData = [];
  final List<String> jsonPaths = [
    'assets/data/malik.json',
    'assets/data/ahmed.json',
    'assets/data/muslim.json',
  ];

  final List<HadithBooks> hadithBooks = [
    HadithBooks(
      authorArabic: 'الإمام مسلم بن الحجاي',
      authorEnglish: 'Imam Muslim ibn al-Hajjaj al-Naysaburi',
      length: '91',
      titleArabic: "صحيح مسلم",
      titleEnglish: "Sahih Muslim",
    ),
    HadithBooks(
      authorArabic: "الإمام يحيى بن شرف النووي",
      authorEnglish: "Imam Yahya ibn Sharaf al-Nawawi",
      length: '42',
      titleArabic: "الأربعون النووية",
      titleEnglish: "The Forty Hadith",
    ),
    HadithBooks(
      authorArabic: "الإمام يحيى بن شرف النووي",
      authorEnglish: "Imam Yahya ibn Sharaf al-Nawawi",
      length: '679',
      titleArabic: "رياض الصالحين",
      titleEnglish: "Riyad as-Salihin",
    ),
  ];

  Future<void> _loadJsonData() async {
    for (final path in jsonPaths) {
      final String response = await rootBundle.loadString(path);
      final data = json.decode(response);
      chapterData.add(data['chapters']);
      hadithData.add(data['hadiths']);
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.accentColor,
        appBar: AppBar(
          backgroundColor: colors.accentColor,
          centerTitle: true,
          title: const Text(
            'Hadith',
            style: TextStyle(fontFamily: 'Poppins'),
          ),
        ),
      body: chapterData.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Padding(
            padding: const EdgeInsets.all(10.0),
            child: GridView.builder(
                itemCount: hadithBooks.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  final hadithBook = hadithBooks[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChapterScreen(
                            chapters: chapterData[index],
                            hadiths: hadithData[index],
                          ),
                        ),
                      );
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
                          padding:
                              const EdgeInsets.only(left: 10, right: 10, top: 30),
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
                                    '${hadithBook.length} hadiths',
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
              ),
          ),
    );
  }
}
