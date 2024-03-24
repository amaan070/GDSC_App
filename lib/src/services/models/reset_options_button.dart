import 'package:flutter/material.dart';

class ResetOptionButton extends StatelessWidget {
  const ResetOptionButton(
      {required this.btnIcon,
      required this.title,
      required this.subtitle,
      required this.onTap,
      super.key});

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 60,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                Text(subtitle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
