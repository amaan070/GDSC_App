// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/auth/welcome_screen.dart';
import 'package:gdsc_app/src/pages/bottom_navigation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      _navigatetoHomeScreen();
    } else {
      _navigatetoWelcomeScreen();
    }
  }

  _navigatetoWelcomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const WelcomeScreen()));
  }

  _navigatetoHomeScreen() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const BottomNavigator()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    child: Image.asset(
                  'assets/images/GDSC-Logo2.png',
                  width: 200,
                )),
                Container(
                    child: const Text(
                  'Google Developers Students Club',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
                Container(
                    child: const Text(
                        'Zakir Hussain College of Engineering and Technology',
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.italic))),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}
