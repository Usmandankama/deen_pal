import 'package:deen_pal/screens/hadith_Screen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import '../components/hadith_pageview.dart';

class ChapterScreen extends StatelessWidget {
  final List<dynamic> chapters;
  final List<dynamic> hadiths;

  const ChapterScreen({Key? key, required this.chapters, required this.hadiths}) : super(key: key);

  List<dynamic> _getHadithsByChapterId(int chapterId) {
    return hadiths.where((hadith) => hadith['chapterId'] == chapterId).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        title: const Text('Chapters'),
        centerTitle: true,
        backgroundColor: colors.primaryColor,
      ),
      body: ListView.builder(
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapterItem = chapters[index];
          final chapterId = chapterItem['id'];
          final chapterName = chapterItem['english'];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              tileColor: colors.tileColor,
              onTap: () {
                final filteredHadiths = _getHadithsByChapterId(chapterId);
                print(filteredHadiths);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HadithScreen(hadithContent: filteredHadiths,chapterName:chapterName),
                  ),
                );
              },
              leading: Text(
                '${chapterItem['id']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 20,
                ),
              ),
              title: Text(
                '${chapterItem['english']}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.fontColorLight,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
        },
      ),
    );
  }
}
