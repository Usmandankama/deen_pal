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
    double padding = 10.0;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: colors.primaryColor,
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
      backgroundColor: colors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
              const NextPrayer(),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Features',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: colors.fontColorLight,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AllFeatures(),
                            ));
                      },
                      child: Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 17,
                          color: colors.secondaryColor,
                        ),
                      ),
                    ),
                  )
                ],
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
