import 'package:flutter/material.dart';
import 'package:gdsc_app/src/constants/colors.dart';
import 'package:gdsc_app/src/features/authentication/screens/login_screen.dart';
import 'package:gdsc_app/src/features/authentication/screens/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [themeBackgroundPeach, themeBackgroundWhite],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 100,
          ),
          Text(
            'WELCOME! DEVELOPER',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 33),
          ),
          const SizedBox(
            height: 80,
          ),
          Text(
            'I am your assistant. Let us get going!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              height: 300,
              width: 300,
              child: Image.asset('assets/images/Robot.png')),
          Text(
            "Dive into the community of developers. Embrace your passion!",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: 12.5),
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text('Login')),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Signup()));
                      },
                      child: const Text(
                        'Signup',
                      )),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              SizedBox(
                height: 50,
                width: 100,
                child: Image.asset('assets/images/GDSC-Logo2.png'),
              ),
              Text(
                'GDSC ZHCET',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    fontSize: 15,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Communicate.Colaborate.Create.',
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
