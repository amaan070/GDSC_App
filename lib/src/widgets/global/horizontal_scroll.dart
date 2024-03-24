import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HorizontalScroll extends StatelessWidget {
  const HorizontalScroll({
    super.key,
    required this.textTheme,
    required this.imageUrl,
    required this.link,
  });

  final TextTheme textTheme;
  final String imageUrl;
  final String link;

  Future openAppWebView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Invalid Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 290,
      child: GestureDetector(
        onTap: () {
          openAppWebView(link);
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(imageUrl), fit: BoxFit.fitHeight),
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.background),
          padding: const EdgeInsets.all(20),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //second Row
            ],
          ),
        ),
      ),
    );
  }
}
