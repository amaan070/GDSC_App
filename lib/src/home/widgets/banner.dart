import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard(
      {super.key,
      required this.textTheme,
      required this.text1,
      required this.text2});

  final TextTheme textTheme;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 247, 245, 245)),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(child: Image.asset('assets/images/GDSC-Logo2.png')),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              text1,
              style: textTheme.displayLarge,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              text2,
              style: textTheme.displaySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
