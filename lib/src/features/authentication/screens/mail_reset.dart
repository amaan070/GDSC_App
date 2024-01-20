import 'package:flutter/material.dart';
import 'package:gdsc_app/src/constants/colors.dart';
import 'package:gdsc_app/src/firebase/firebase_functions.dart';

class MailReset extends StatefulWidget {
  const MailReset({super.key});

  @override
  State<MailReset> createState() => _MailResetState();
}

class _MailResetState extends State<MailReset> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeBackgroundPeach,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [themeBackgroundPeach, themeBackgroundWhite],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/images/yellow_circle.png'),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Forgot Password',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: const Color.fromARGB(201, 0, 0, 0)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password reset via E-mail',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: 'E-Mail',
                    hintText: 'abc@xyz.com',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          passwordReset(_emailController.text.trim(), context);
                        },
                        child: const Text('Reset Password'))),
              ],
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
          ],
        ),
      ),
    );
  }
}
