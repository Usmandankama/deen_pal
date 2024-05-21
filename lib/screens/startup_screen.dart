import 'package:deen_pal/screens/introScreens/page1.dart';
import 'package:deen_pal/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'introScreens/page2.dart';
import 'introScreens/page3.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  bool onLastpage = false;
  @override
  Widget build(BuildContext context) {
    final pageController = PageController();
    return Scaffold(
      backgroundColor: colors.primaryColor,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                onLastpage = (value == 2);
              });
            },
            children: [
              Page1(),
              const Page2(),
              const Page3(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40,left: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: SmoothPageIndicator(
                  effect: ExpandingDotsEffect(
                    dotColor: colors.primaryColor,
                    activeDotColor: colors.secondaryColor,
                    spacing: 8,
                  ),
                  controller: pageController,
                  count: 3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                  onTap: () {
                    if (onLastpage) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    }
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeIn);
                  },
                child: CircleAvatar(
                  backgroundColor: colors.secondaryColor,
                  foregroundColor: colors.primaryColor,
                radius: 30,
                  child: onLastpage
                      ? const Text(
                        'Done',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,fontWeight: FontWeight.w500
                          ),
                        )
                      : const Icon(
                        Icons.arrow_forward_rounded,
                        size: 30,
                        )
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
