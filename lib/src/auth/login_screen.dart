import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';
import 'package:gdsc_app/src/services/models/login_form.dart';
import 'package:gdsc_app/src/auth/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: Image.asset('assets/images/GDSC-Logo2.png'),
            ),
            Text(
              'HEY DEVELOPER! LOGIN HERE!',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/Robot3.png',
              height: size * 0.3,
            ),
            const SizedBox(
              height: 15,
            ),
            const LoginForm(),
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
                              builder: (context) => const Signup()));
                    },
                    child: const Text("Don't have an account? Signup")),
              ],
            )
          ],
        ),
      )),
    );
  }
}
