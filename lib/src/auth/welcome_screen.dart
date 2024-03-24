import 'package:flutter/material.dart';
import 'package:gdsc_app/src/theme/theme_select_screen.dart';
import 'package:gdsc_app/src/auth/login_screen.dart';
import 'package:gdsc_app/src/auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // ignore: avoid_unnecessary_containers
      body: Container(
        padding: const EdgeInsets.all(10),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          const SizedBox(
            height: 70,
          ),
          Text(
            'WELCOME! DEVELOPER',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 33),
          ),
          Text(
            'I am your assistant. Let us get going!',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              height: 290,
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
          OutlinedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThemeSelector()));
              },
              child: Text(
                'Change Theme',
                style: Theme.of(context).textTheme.displaySmall!,
              )),
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
