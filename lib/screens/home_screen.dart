import 'package:deen_pal/components/myCategories.dart';
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
      backgroundColor: colors.accentColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            children: [
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
