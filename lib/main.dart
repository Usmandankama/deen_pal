import 'package:deen_pal/screens/startup_screen.dart';
import 'package:flutter/material.dart';
import 'constants/colors.dart' as colors;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: colors.secondaryColor),
      debugShowCheckedModeBanner: false,
      home: const StartupScreen(),
    );
  }
}
