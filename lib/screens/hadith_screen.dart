import 'package:deen_pal/components/hadith_pageview.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class HadithScreen extends StatefulWidget {
  final List<dynamic> hadithContent;
  String chapterName;
  
  HadithScreen({super.key, required this.hadithContent, required this.chapterName});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.primaryColor,
      appBar: AppBar(
        title: Text(
          widget.chapterName,
          style: const TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
        centerTitle: true,
        backgroundColor: colors.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: colors.tileColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: HadithPageview(hadithContent: widget.hadithContent),
      ),
    );
  }
}
