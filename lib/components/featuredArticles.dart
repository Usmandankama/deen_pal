import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class FeaturedArticles extends StatefulWidget {
  const FeaturedArticles({super.key});

  @override
  State<FeaturedArticles> createState() => _FeaturedArticlesState();
}

class _FeaturedArticlesState extends State<FeaturedArticles> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 150,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: colors.secondaryColor,
      ),
      child: const Column(
        children: [],
      ),
    );
  }
}
