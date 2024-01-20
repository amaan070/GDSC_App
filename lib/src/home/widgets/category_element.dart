import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement(
      {super.key,
      required this.textTheme,
      required this.initial,
      required this.eventName,
      required this.number});

  final TextTheme textTheme;
  final String initial;
  final String eventName;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 45,
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(0.9),
            ),
            child: Center(
              child: Text(
                initial,
                style: textTheme.displaySmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  eventName,
                  style: textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  number,
                  style: textTheme.labelSmall,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
