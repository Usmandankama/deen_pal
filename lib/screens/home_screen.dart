import 'package:deen_pal/components/myCategories.dart';
import 'package:deen_pal/components/nextPrayer.dart';
import 'package:deen_pal/screens/all_features_screeen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: colors.primaryColor,
        foregroundColor: colors.fontColorLight,
        title: const Row(
          children: [
            CircleAvatar(),
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamualikum',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Poppins'),
                ),
                Text(
                  'Usman Abubakar',
                  style: TextStyle(fontFamily: 'Poppins'),
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      backgroundColor:colors.primaryColor,
      body: ListView(
        // padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        children: [
          const NextPrayer(),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MyCategories(),
          ),
        ],
      ),
    );
  }
}
