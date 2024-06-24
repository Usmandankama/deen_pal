import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    // final deviceHeight = MediaQuery.of(context).size.height;
  return Scaffold(
      backgroundColor: colors.primaryColor,
      body: Column(
        children: [
          Container(
            height: 600,
            width: deviceWidth,
            decoration: BoxDecoration(
            color: colors.primaryColor,
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/zakat.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'We provide you with the best Islamic app experience',
              style: TextStyle(
                color: colors.fontColorLight,
                fontSize: 23,
                fontFamily: 'Poppins',
              ),
            ),
          )
        ],
      ),
    );
  }
}
