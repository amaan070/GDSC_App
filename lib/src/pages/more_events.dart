import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Event {
  final Text title;
  final String subtitle;
  final String imageUrl;
  final String date;
  final String link;

  Event({
    required this.date,
    required this.title,
    required this.link,
    required this.subtitle,
    required this.imageUrl,
  });
}

class MoreEvents extends StatelessWidget {
  MoreEvents({super.key});
  final List<Event> events = [
    Event(
      title: const Text(
        'Speaker Session / Tech Talk',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '11 Mar, 2024',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-getting-started-with-flutter-by-google-developer-expert-for-flutter-amp-dart/',
      subtitle:
          'Getting started with Flutter, by Google Developer Expert for Flutter & Dart.',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_kpZzKwh.png', // Provide actual image paths or URLs
    ),
    Event(
      title: const Text(
        'Speaker Session / Tech Talk',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '7 Mar, 2024',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-on-aiml/',
      subtitle: 'Speaker Session on AI/ML',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/ai-ml_cV7uwMx.png',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '16 Jan, 2024',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-machine-learning-workshop-2/',
      subtitle: 'Machine Learning Workshop 2',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/15658638_J2ICxqx_f6613Ft.png',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '9 Jan, 2024',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-machine-learning-workshop-1/',
      subtitle: 'Machine Learning Workshop 1',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/15658638_J2ICxqx_f6613Ft.png',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '19 Dec, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-android-development-workshop/',
      subtitle: 'Android Development Workshop 2',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/Screenshot%202024-01-09%20145314.png',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '21 Nov, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-deep-dive-into-web-development/',
      subtitle: 'Deep Dive into Web Development',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_Rijs0eG.png',
    ),
    Event(
      title: const Text(
        'Speaker Session / Tech Talk',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '23 Oct, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-with-github-campus-expert/',
      subtitle: 'Speaker Session with GitHub Campus Expert',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_92oLMzR.png',
    ),

    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '22 Oct, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-training-session-3-on-google-cloud-study-jam-23/',
      subtitle: "Training Session-3 on Google Cloud Study Jam '23",
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_Fp4M8Gc_ipY7idf.jpg',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '15 Oct, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-training-session-2-on-google-cloud-study-jam-23/',
      subtitle: "Training Session-2 on Google Cloud Study Jam '23",
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_Fp4M8Gc_ipY7idf.jpg',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '5 Oct, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-training-session-1-on-google-cloud-study-jam-23/',
      subtitle: "Training Session-1 on Google Cloud Study Jam '23",
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_Fp4M8Gc_ipY7idf.jpg',
    ),
    Event(
      title: const Text(
        'Workshop / Study Group',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '26 Sept, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-speaker-session-on-google-cloud-study-jam-23/',
      subtitle: "Speaker Session on Google Cloud Study Jam '23",
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/download_Fp4M8Gc_ipY7idf.jpg',
    ),
    Event(
      title: const Text(
        'Info Session',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      date: '28 Aug, 2023',
      link:
          'https://gdsc.community.dev/events/details/developer-student-clubs-zakir-husain-college-of-engineering-and-technology-aligarh-presents-orientation-ceremony-cum-info-session/',
      subtitle: 'Orientation Ceremony cum Info Session',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_500,h_500,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/events/hhgj.png',
    ),
    // Add more events here
  ];
  Future openAppWebView(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView)) {
      throw Exception('Invalid Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text(
          'All Events',
          style:
              Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(event.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: event.title,
            subtitle: Text('${event.subtitle} \n ${event.date}'),
            trailing: GestureDetector(
                onTap: () {
                  openAppWebView(event.link);
                },
                child: const Icon(Icons.link_sharp)),
          );
        },
      ),
    );
  }
}
