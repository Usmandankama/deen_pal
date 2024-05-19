import 'package:deen_pal/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isobscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.accentColor,
      appBar: AppBar(
        backgroundColor: colors.accentColor,
        foregroundColor: colors.fontColorLight,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  'login',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 37,
                    fontFamily: 'Poppins',
                    color: colors.fontColorLight,
                    // color:
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: colors.textFieldColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      iconColor: colors.secondaryColor,
                      prefixIcon: Icon(Icons.email_rounded),
                      hintText: 'email',
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: colors.textFieldColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    autocorrect: false,
                    obscureText: isobscured ? true : false,
                    decoration: InputDecoration(
                      iconColor: colors.secondaryColor,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isobscured) {
                              isobscured = false;
                            } else {
                              isobscured = true;
                            }
                          });
                        },
                        icon: isobscured
                            ? const Icon(Icons.visibility_off)
                            : Icon(
                                Icons.visibility,
                                color: colors.secondaryColor,
                              ),
                      ),
                      prefixIcon: const Icon(Icons.lock_rounded),
                      hintText: 'password',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'forgot password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      colors.secondaryColor,
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 140,
                        vertical: 15,
                      ),
                    ),
                  ),
                  child: Text(
                    'login',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: colors.fontColorLight,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Dont have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(horizontal: 0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 13,
                          color: colors.secondaryColor,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
