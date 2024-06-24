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
  // Method to load Surah data from JSON files asynchronously
  Future<List<Surah>> _loadSurahData() async {
    try {
      // Load and decode the main Quran JSON file
      final String response =
          await rootBundle.loadString('assets/data/quran.json');
      final data = json.decode(response);

      // Load and decode the translated Quran JSON file
      final String responseTranslated =
          await rootBundle.loadString('assets/data/translation.json');
      final dataTranslated = json.decode(responseTranslated);

      // Create a list to hold Surah objects
      List<Surah> surahs = [];

      // Populate the list with Surah objects, combining data from both JSON files
      for (int i = 0; i < data['surahs'].length; i++) {
        final surah = data['surahs'][i];
        final surahTranslated = dataTranslated['surahs'][i];
        surahs.add(Surah(
          surahNameEng: surah['englishNameTranslation'],
          surahNameArabic: surah['name'],
          cityRevealed: surah['revelationType'],
          ayahts: surah['ayahs'],
          ayahtsTranslated: surahTranslated['ayahs'],
        ));
      }

      // Return the list of Surah objects
      return surahs;
    } catch (e) {
      // Throw an exception if there is an error loading JSON data
      throw Exception('Error loading JSON data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
      // Call the method to load Surah data
      future: _loadSurahData(),
      builder: (context, snapshot) {
        // Display a loading indicator while the data is being fetched
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        // Display an error message if there is an error loading the data
        else if (snapshot.hasError) {
          return const Center(child: Text('Error loading data'));
        }
        // Display the list of Surahs once the data is successfully loaded
        else {
          final surahs = snapshot.data!;
          return ListView(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                    // color: Colors.white
                    image: DecorationImage(
                  image: AssetImage('assets/images/bg2.jpg'),
                  fit: BoxFit.cover,
                )),
                child: const Column(children: []),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: surahs.length,
                itemBuilder: (context, index) {
                  final surah = surahs[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: ListTile(
                      // Set the tile color
                      tileColor: colors.tileColor,
                      // Navigate to the Surah details page when a tile is tapped
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SurahContent(surah: surah),
                          ),
                        );
                      },
                      // Display the Surah index
                      leading: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Poppins',
                          color: colors.fontColorLight,
                        ),
                      ),
                      // Display the Surah name in Arabic
                      trailing: Text(
                        surah.surahNameArabic,
                        style: TextStyle(
                          fontSize: 25,
                          color: colors.fontColorLight,
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        }
      },
    );
  }
}
