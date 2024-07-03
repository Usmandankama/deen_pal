import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/azkar.dart';

class AzkarScreen extends StatefulWidget {
  const AzkarScreen({super.key});

  @override
  State<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends State<AzkarScreen> {
  List<Azkar> azkarList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final String response =
        await rootBundle.loadString('assets/data/hisn_almuslim.json');
    final data = json.decode(response);
    for (var i = 0; i < data['azkar'].length; i++) {
      final azkar = data['azkar'];
      print(azkar['المقدمة']);
      // azkarList.add(
      //   Azkar(
      //     text: azkar['text'],
      //     title: azkar['title'],
      //   ),
      // );
    }
    // print(data['azkar'].length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
