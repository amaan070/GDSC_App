import 'package:flutter/material.dart';
// import 'package:gdsc_app/src/firebase/firebase_functions.dart';
// import 'package:gdsc_app/src/features/authentication/google_authentication/google_authentication.dart';
import 'package:gdsc_app/src/home/widgets/banner.dart';
import 'package:gdsc_app/src/home/widgets/category_element.dart';
import 'package:gdsc_app/src/home/widgets/horizontal_scroll.dart';
import 'package:gdsc_app/src/home/widgets/search_box.dart';

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
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'GDSC',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.only(top: 7, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person_pin),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //heading
                Text(
                  'Hey User',
                  style: textTheme.displaySmall,
                ),
                Text(
                  'Explore Events',
                  style: textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                //Search Box
                const SearchBox(),
                const SizedBox(
                  height: 30,
                ),
                //Categories
                SizedBox(
                  height: 45,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryElement(
                        textTheme: textTheme,
                        initial: 'JS',
                        eventName: 'Java Script',
                        number: '10 Lessons',
                      ),
                      CategoryElement(
                        textTheme: textTheme,
                        initial: 'JS',
                        eventName: 'Java Script',
                        number: '10 Lessons',
                      ),
                      CategoryElement(
                        textTheme: textTheme,
                        initial: 'JS',
                        eventName: 'Java Script',
                        number: '10 Lessons',
                      ),
                    ],
                  ),
                ),
                //Banners
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    BannerCard(
                        textTheme: textTheme, text1: 'text1', text2: 'text2'),
                    const SizedBox(
                      width: 10,
                    ),
                    BannerCard(
                        textTheme: textTheme, text1: 'text3', text2: 'text4'),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Text('Top Events',
                    style: textTheme.displayLarge!
                        .copyWith(color: Colors.black, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 290,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      HorizontalScroll(textTheme: textTheme),
                      HorizontalScroll(textTheme: textTheme),
                      HorizontalScroll(textTheme: textTheme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
