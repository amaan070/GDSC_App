import 'package:flutter/material.dart';
import 'package:gdsc_app/src/features/authentication/models/reset_options_button.dart';
import 'package:gdsc_app/src/features/authentication/screens/mail_reset.dart';
import 'package:gdsc_app/src/features/authentication/screens/phone_reset.dart';

Future<dynamic> resetOptions(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 255, 237, 208),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      context: context,
      builder: (context) => Container(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Reset Password',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                  'Select one of the options below to reset your password:'),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: [
                  ResetOptionButton(
                      btnIcon: Icons.mail_outline_rounded,
                      title: 'E-Mail',
                      subtitle: 'Reset password via E-Mail',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MailReset()));
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  ResetOptionButton(
                      btnIcon: Icons.phone_android_rounded,
                      title: 'Phone',
                      subtitle: 'Reset password via Phone',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhoneReset()));
                      })
                ],
              )
            ]),
          ));
}
