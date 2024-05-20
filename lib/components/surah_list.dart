import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:deen_pal/models/surah.dart';
import 'package:deen_pal/screens/surah_content.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class SurahList extends StatefulWidget {
  const SurahList({super.key});
  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  final GlobalKey _listKey = GlobalKey();
  List<dynamic> ayahts = [];
  List<dynamic> ayahtsTranslated = [];
  List<dynamic> surats = [];
  List<dynamic> suratsTranslated = [];
  bool connectionError = false;

  @override
  void initState() {
    super.initState();
    readJsonData();
  }

  void readJsonData() async {
    final String responses =
        await rootBundle.loadString('assets/data/quran.json');
    final data = await json.decode(responses);
    final String responsesTranslated =
        await rootBundle.loadString('assets/data/translation.json');
    final dataTranslated = await json.decode(responsesTranslated);
    setState(() {
      surats = data['surahs'];
      suratsTranslated = dataTranslated['surahs'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      key: _listKey,
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: surats.length,
      itemBuilder: (context, index) {
        int itemIndex = index + 1;
        final surah = surats[index];
        final surahTranslated = suratsTranslated[index];
        final listOfAyahs = surah['ayahs'];
        ayahts = listOfAyahs;
        final listOfAyahsTranslated = surahTranslated['ayahs'];
        ayahtsTranslated = listOfAyahsTranslated;
        final name = surah['name'];
        // final engName = surah['englishNameTranslation'];
        var surat = Surah(
            surahNameEng: surah['englishNameTranslation'],
            surahNameArabic: surah['name'],
            cityRevealed: surah['revelationType'],
            ayahts: listOfAyahs,
            ayahtsTranslated: listOfAyahsTranslated);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListTile(
                
                tileColor: colors.tileColor,
                // textColor: colors.secondaryFontColor,
                onTap: () {
                  // Navigate to a Surah details page on item click.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SurahContent(surah: surat),
                    ),
                  );
                },
                leading: Text(
                  '$itemIndex',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Poppins',
                    color: colors.fontColorLight,
                  ),
                ),
                trailing: Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                    color: colors.fontColorLight,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
