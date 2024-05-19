import 'package:flutter/material.dart';
import 'package:deen_pal/constants/colors.dart' as colors;

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isobscured = true;
  bool isobscured_2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colors.accentColor,
      appBar: AppBar(
        backgroundColor: colors.accentColor,
        elevation: 0,
        foregroundColor: colors.fontColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'register',
                  style: TextStyle(
                    letterSpacing: 3,
                    fontSize: 37,
                    fontFamily: 'Poppins',
                    color: colors.fontColorLight,
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
                  child: const TextField(
                    autocorrect: false,
                    decoration: InputDecoration(
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: isobscured ? true : false,
                    decoration: InputDecoration(
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
                            : const Icon(Icons.visibility),
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
                const SizedBox(height: 15),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: colors.textFieldColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  child: TextField(
                    autocorrect: false,
                    enableSuggestions: false,
                    obscureText: isobscured_2 ? true : false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isobscured_2) {
                              isobscured_2 = false;
                            } else {
                              isobscured_2 = true;
                            }
                          });
                        },
                        icon: isobscured_2
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                      prefixIcon: const Icon(Icons.lock_rounded),
                      iconColor: colors.secondaryColor,
                      hintText: 'confirm password',
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                      colors.secondaryColor,
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(
                        horizontal: 130,
                        vertical: 15,
                      ),
                    ),
                  ),
                  child: Text(
                    'register',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Poppins',
                      color: colors.fontColorLight,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 13,
                        color: colors.fontColorLight,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextButton(
                      style: const ButtonStyle(
                        // padding: MaterialStatePropertyAll(
                        //   EdgeInsets.symmetric(horizontal: 0),
                        // ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Login',
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
