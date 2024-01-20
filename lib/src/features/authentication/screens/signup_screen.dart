import 'package:flutter/material.dart';
import 'package:gdsc_app/src/constants/colors.dart';
import 'package:gdsc_app/src/features/authentication/google_authentication/google_authentication.dart';
import 'package:gdsc_app/src/features/authentication/models/signup_form.dart';
import 'package:gdsc_app/src/features/authentication/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [themeBackgroundPeach, themeBackgroundWhite],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset('assets/images/GDSC-Logo2.png'),
                ),
                Text(
                  'PLEASE INTRODUCE YOURSELF, DEVELOPER!',
                  style: GoogleFonts.exo2(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(172, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/Robot2.png',
                  height: size * 0.3,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SignupForm(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Or'),
                    OutlinedButton.icon(
                        icon: Image.asset('assets/images/google.png'),
                        onPressed: () {
                          FirebaseService.signInwithGoogle(context);
                        },
                        label: const Text('Sign-in with Google')),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: const Text('Already have an account? Login')),
                    // const SizedBox(
                    //   height: 100,
                    // )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
