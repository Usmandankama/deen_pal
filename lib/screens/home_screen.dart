import 'package:deen_pal/components/myCategories.dart';
import 'package:deen_pal/components/videosSection.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import '../components/featuredArticles.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

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
      backgroundColor: colors.accentColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: 500,
                    decoration: BoxDecoration(
                      color: colors.tileColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dhuhr',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  color: colors.fontColorLight,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '11:45',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 30,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'pm',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 17,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Next prayer: ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                  Text(
                                    'Asr',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '4:00',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'pm',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 18,
                                      color: colors.fontColorLight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          CircleAvatar(
                            backgroundColor: colors.secondaryColor,
                            foregroundColor: Colors.black,
                            child: const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Categories',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: colors.fontColorLight),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: MyCategories(),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Videos',
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      color: colors.fontColorLight),
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VideosWidget(),
                VideosWidget(),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                VideosWidget(),
                VideosWidget(),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Featured',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: colors.fontColorLight,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: FeaturedArticles(),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: FeaturedArticles(),
            ),
          ],
        ),
      ),
    );
  }
}
