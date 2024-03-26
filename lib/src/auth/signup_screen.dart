import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';
import 'package:gdsc_app/src/services/models/signup_form.dart';
import 'package:gdsc_app/src/auth/login_screen.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Container(
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
                  style: Theme.of(context).textTheme.displaySmall,
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
                          signInwithGoogle(context);
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
