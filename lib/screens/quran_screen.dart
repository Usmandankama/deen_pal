import 'package:flutter/material.dart';
// import 'package:isoul/widgets/surah_list.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import '../components/surah_list.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Al-Quran'),
        backgroundColor: colors.accentColor,
        centerTitle: true,
      ),
      backgroundColor: colors.accentColor,
      body: const SurahList(),
    );
  }
}
