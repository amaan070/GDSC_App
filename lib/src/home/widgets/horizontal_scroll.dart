import 'package:flutter/material.dart';
import 'package:gdsc_app/src/firebase/firebase_functions.dart';
import 'package:gdsc_app/src/features/authentication/google_authentication/google_authentication.dart';

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 290,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 247, 245, 245)),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    'Sample Text',
                    style: textTheme.displayLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(child: Image.asset('assets/images/google.png')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //second Row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(shape: const CircleBorder()),
                    onPressed: () {
                      signOut(context);
                      FirebaseService.signOutFromGoogle();
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Logged out!'),
                        backgroundColor: Color.fromARGB(255, 210, 36, 23),
                      ));
                    },
                    child: const Icon(Icons.logout)),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Logout',
                  style: textTheme.bodyLarge!
                      .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
