import 'package:flutter/material.dart';

class Categories {
  String text;
  String subText;
  String imagePath;
  Widget targetClass;

  Categories({
    required this.imagePath,
    required this.targetClass,
    required this.text,
    required this.subText,
  });
}
