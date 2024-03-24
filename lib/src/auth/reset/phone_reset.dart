import 'package:flutter/material.dart';

class PhoneReset extends StatelessWidget {
  const PhoneReset({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.background,
        // decoration: const BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [themeBackgroundPeach, themeBackgroundWhite],
        //         begin: Alignment.topLeft,
        //         end: Alignment.bottomRight)),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Image.asset('assets/images/cuate.png'),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Forgot Password?',
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Password reset via Phone Number',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: 'Phone Number',
                    hintText: '+91-xxxxxxxxxx',
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
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('Currently under progress'),
                                );
                              });
                        },
                        child: const Text('Send OTP'))),
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
