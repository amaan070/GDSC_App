import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/models/create_profile_form.dart';

class CreateProfile extends StatelessWidget {
  const CreateProfile({super.key});

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
                  'CREATE A PROFILE!',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 20),
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
                const CreateProfileForm(),
              ]),
        ),
      ),
    );
  }
}
