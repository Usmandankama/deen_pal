import 'package:deen_pal/components/hadith_pageview.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class HadithScreen extends StatefulWidget {
  String hadithName;
  List<dynamic> hadithContent = [];
  HadithScreen(
      {super.key, required this.hadithContent, required this.hadithName});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 0,
        title: Text(
          widget.hadithName,
          style: const TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: colors.accentColor,
      ),
      body: HadithPageview(
        hadithContent: widget.hadithContent,
      ),
    );
  }
}
