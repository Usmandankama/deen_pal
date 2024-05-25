import 'package:deen_pal/components/hadith_categories.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class HadithCategoryScreen extends StatefulWidget {
  const HadithCategoryScreen({super.key});

  @override
  State<HadithCategoryScreen> createState() => _HadithCategoryScreenState();
}

class _HadithCategoryScreenState extends State<HadithCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return const HadithCategories();
  }
}
