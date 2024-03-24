import 'package:flutter/material.dart';
import 'package:gdsc_app/src/pages/about.dart';
import 'package:gdsc_app/src/pages/events.dart';
import 'package:gdsc_app/src/pages/home.dart';
import 'package:gdsc_app/src/pages/profile_page.dart';
import 'package:gdsc_app/src/pages/team.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int myIndex = 0;
  List<Widget> pages = [
    const MyHomePage(
      title: 'GDSC',
    ),
    const EventsPage(),
    const AboutUsPage(),
    TeamPage(),
    const ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(() {
                myIndex = index;
              });
            },
            currentIndex: myIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.house,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: '',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.book,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: '',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.circleInfo,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: '',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.peopleGroup,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: '',
                  backgroundColor: Colors.transparent),
              BottomNavigationBarItem(
                  icon: Icon(
                    FontAwesomeIcons.user,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: '',
                  backgroundColor: Colors.transparent),
            ]),
        body: pages[myIndex],
      ),
    );
  }
}
