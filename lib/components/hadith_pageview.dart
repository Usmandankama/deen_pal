import 'package:deen_pal/models/hadith.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class HadithPageview extends StatelessWidget {
  List<dynamic> hadithContent = [];
  HadithPageview({super.key, required this.hadithContent});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: hadithContent.length,
      itemBuilder: (context, index) {
        var hadiths = hadithContent[index];
        var english = hadiths['english']['text'];
        var narrator = hadiths['english']['narrator'];
        // final hadith = hadiths['d'];
        var hadith = Hadith(
            arabic: hadiths['arabic'],
            english: english,
            id: hadiths['id'],
            narrator: narrator);
        return Scaffold(
          backgroundColor: colors.accentColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  // height: double.infinity,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          spreadRadius: 1,
                          offset: const Offset(0, 10),
                          color: Colors.black.withOpacity(.5),
                        )
                      ],
                      color: colors.tileColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Text(
                        '${hadith.id}',
                        style: TextStyle(
                          color: colors.fontColorLight,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      Text(
                        hadith.arabic,
                        style: TextStyle(
                          fontSize: 20,
                          color: colors.fontColorLight,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        hadith.narrator,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          color: colors.fontColorLight,
                        ),
                      ),
                      Text(
                        hadith.english,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          color: colors.fontColorLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
