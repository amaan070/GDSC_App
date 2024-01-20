import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gdsc_app/src/home/home.dart';
import 'package:gdsc_app/src/constants/colors.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({required this.codeAddress, super.key});
  final String codeAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [themeBackgroundPeach, themeBackgroundWhite],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          padding: const EdgeInsets.all(30.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(),
            SizedBox(
                width: 220,
                height: 220,
                child: Image.asset('assets/images/otp.png')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'VERIFICATION',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Enter the verification code sent at  \n$codeAddress',
              style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              keyboardType: TextInputType.number,
              onSubmit: null,
            ),
            const SizedBox(
              height: 1,
            ),
            TextButton(onPressed: () {}, child: const Text('Resend OTP')),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MyHomePage(title: 'GDSC_APP')));
                    },
                    child: const Text('SUBMIT'))),
          ]),
        ),
      ),
    );
  }
}
