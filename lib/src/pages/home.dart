import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/widgets/global/horizontal_scroll.dart';
import 'package:gdsc_app/src/widgets/global/search_box.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //docIDs
  List<String> docIds = [];

  //get docIDs
  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIds.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          foregroundColor: Theme.of(context).colorScheme.primary,
          title: Text(
            'GDSC',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: const Icon(Icons.pages),
          actions: [
            SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('assets/images/GDSC-Logo2.png')),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(
                      width: 7.5,
                    ),
                    const Icon(Icons.find_in_page),
                    Text(
                      ' Find in the community',
                      style: textTheme.displaySmall,
                    ),
                  ],
                ),
                // Search Box
                const SearchBox(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Welcome to GDSC!',
                  style: textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage('assets/images/ZH.png'),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(15),
                  child: const SizedBox(
                    height: 160,
                    width: 350,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text('Top Events',
                    style: textTheme.displayLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 250,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
