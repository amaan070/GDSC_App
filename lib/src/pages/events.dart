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
                  Text(
                    'Past Events',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 25),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 315,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl:
                              'https://res.cloudinary.com/startup-grind/image/upload/c_scale,w_2560/c_crop,h_640,w_2560,y_0.0_mul_h_sub_0.0_mul_640/c_crop,h_640,w_2560/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/event_banners/GDE%20flutter%20sessinnn.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-getting-started-with-flutter-by-google-developer-expert-for-flutter-amp-dart/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl:
                              'https://res.cloudinary.com/startup-grind/image/upload/c_scale,w_2560/c_crop,h_640,w_2560,y_0.0_mul_h_sub_0.0_mul_640/c_crop,h_640,w_2560/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/event_banners/AI%20session%20GDSChh.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-on-aiml/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl:
                              'https://res.cloudinary.com/startup-grind/image/upload/c_scale,w_2560/c_crop,h_640,w_2560,y_0.0_mul_h_sub_0.0_mul_640/c_crop,h_640,w_2560/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/event_banners/REGISTER%20NOW%21%20%28Facebook%20Cover%29_1XcSAwP.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-with-github-campus-expert/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        HorizontalScroll(
                          textTheme: textTheme,
                          imageUrl:
                              'https://res.cloudinary.com/startup-grind/image/upload/c_scale,w_2560/c_crop,h_640,w_2560,y_0.0_mul_h_sub_0.0_mul_640/c_crop,h_640,w_2560/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/event_banners/Untitled%201.png',
                          link:
                              'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-machine-learning-workshop-1/',
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MoreEvents()));
                              },
                              child: Text(
                                'More',
                                style: textTheme.displaySmall,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            HorizontalScroll(
                              textTheme: textTheme,
                              imageUrl:
                                  'https://res.cloudinary.com/startup-grind/image/upload/c_scale,w_2560/c_crop,h_640,w_2560,y_0.0_mul_h_sub_0.0_mul_640/c_crop,h_640,w_2560/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/event_banners/REGISTER%20NOW%21%20%28Facebook%20Cover%29_V79c4Xq.png',
                              link:
                                  'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-android-development-workshop/',
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
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
                    height: 10,
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
