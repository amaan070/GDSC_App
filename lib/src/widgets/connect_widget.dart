import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Connect extends StatelessWidget {
  final String text, link;
  final context;

  const Connect(
      {super.key,
      required this.text,
      required this.context,
      required this.link});

  Future<void> openAppWebView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Invalid Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.link),
          const SizedBox(width: 5.0),
          GestureDetector(
              onTap: () {
                openAppWebView(link);
              },
              child:
                  Text(text, style: Theme.of(context).textTheme.displaySmall)),
        ],
      ),
    );
  }
}
