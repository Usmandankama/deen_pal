import 'package:deen_pal/components/myCategories.dart';
import 'package:deen_pal/components/nextPrayer.dart';
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
    double padding = 10.0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: colors.accentColor,
        title: Row(
          children: [
            const CircleAvatar(),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assalamualikum',
                  style: TextStyle(
                      color: colors.fontColorLight,
                      fontSize: 15,
                      fontWeight: FontWeight.w200,
                      fontFamily: 'Poppins'),
                ),
                const Text(
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
      backgroundColor: colors.accentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              const NextPrayer(),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: colors.fontColorLight,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: MyCategories(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
