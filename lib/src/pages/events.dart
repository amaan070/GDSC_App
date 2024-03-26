import 'package:flutter/material.dart';
import 'package:gdsc_app/src/pages/more_events.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gdsc_app/src/widgets/global/horizontal_scroll.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  Future openAppWebView(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Invalid Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: const Icon(Icons.pages),
          title: Text(
            'Events',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 20),
          ),
          actions: [
            SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('assets/images/GDSC-Logo2.png')),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Past Events',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MoreEvents())),
                        child: Text(
                          'More',
                          style: textTheme.displaySmall!.copyWith(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 260,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl: 'assets/images/Event1.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-getting-started-with-flutter-by-google-developer-expert-for-flutter-amp-dart/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl: 'assets/images/Event2.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-on-aiml/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl: 'assets/images/Event3.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-with-github-campus-expert/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl: 'assets/images/Event4.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-machine-learning-workshop-1/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl: 'assets/images/Event5.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-android-development-workshop/',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Upcoming Events',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              content: Text('CURRENTLY : NO UPCOMING EVENTS'),
                            );
                          });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                            image:
                                AssetImage('assets/images/upcomingEvents.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(15),
                      child: const SizedBox(
                        height: 200,
                        width: 400,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
