import 'package:flutter/material.dart';
import '../models/surah.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class SurahContent extends StatefulWidget {
  final Surah surah;
  const SurahContent({
    super.key,
    required this.surah,
  });

  @override
  State<SurahContent> createState() => _SurahContentState();
}

class _SurahContentState extends State<SurahContent> {
  bool isLightMode = true;
  List<dynamic> ayahts = [];
  List<dynamic> ayahtsTranslated = [];
  int index = 1;

  @override
  void initState() {
    super.initState();
    // Initialize the widget state by adding Ayahs from the Surah.
    _addAyah();
  }

  void _addAyah() {
    // Function to add Ayahs to the widget's state.
    setState(() {
      ayahtsTranslated = widget.surah.ayahtsTranslated;
      ayahts = widget.surah.ayahts;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          // isLightMode
              // const Color.fromRGBO(255, 255, 255, 1)
          colors.accentColor,
      appBar: AppBar(
        backgroundColor: colors.accentColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              widget.surah.surahNameArabic,
              style: const TextStyle(),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                setState(() {
                  if (isLightMode == false) {
                    isLightMode = true;
                  } else if (isLightMode) {
                    isLightMode = false;
                  }
                });
              },
              icon: Icon(
                isLightMode
                    ? Icons.light_mode_rounded
                    : Icons.light_mode_outlined,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        itemCount: ayahts.length,
        itemBuilder: (context, index) {
          int itemsIndex = index + 1;
          return Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(5),
                shape: const ContinuousRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                // tileColor: colors.tileColor,
                // textColor: isLightMode ? Colors.black : colors,
                textColor: colors.fontColorLight,
                trailing: Text(
                  "$itemsIndex",
                  style: TextStyle(fontSize: screenheight > 600 ? 25 : 20),
                ),
                title: Text(
                  ayahts[index]['text'],
                  textDirection: TextDirection.rtl,
                  style: TextStyle(fontSize: screenheight > 600 ? 28 : 25),
                ),
                // subtitle: Text(
                //   ayahtsTranslated[index]['text'],
                //   style: TextStyle(
                //     fontSize: screenheight > 600 ? 20 : 15,
                //   ),
                // ),
              ),
              const Divider(
                color: Color.fromARGB(117, 190, 190, 190),
                thickness: 1.2,
              )
            ],
          );
        },
      ),
    );
  }
}
