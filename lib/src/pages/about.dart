import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:gdsc_app/src/pages/team.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  Future openAppWebView(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Invalid Link');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: const Icon(Icons.pages),
          title: Text(
            'GDSC ZHCET',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          actions: [
            SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('assets/images/GDSC-Logo2.png')),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 280,
                  width: 400,
                  child: Image.asset('assets/images/team.jpg'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'About',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10.0),
              Text(
                'Welcome to Google Developer Student Clubs, ZHCET. Google Developer Student Clubs are university-based community groups for students interested in Google developer technologies. By joining a GDSC, students get access to Google Developer resources, build their personal and professional network, and work together to build solutions for local problems in a peer-to-peer learning environment.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 20.0),
              Text(
                'What we do',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletText('Hands-on Workshops', context),
                  _buildBulletText(
                      'Collaborative Events with Fellow GDSCs', context),
                  _buildBulletText(
                      'Talks: Get updated with the latest technologies by the industry experts',
                      context),
                  _buildBulletText(
                      'Codelabs: Get hands-on experience and guidance from the community members',
                      context),
                  _buildBulletText(
                      'Build Projects & Compete in the GDSC Solution Challenge',
                      context),
                  _buildBulletText(
                      'Campus Roadshows: Share knowledge in different Companies, colleges, and universities',
                      context),
                  _buildBulletText(
                      'Share knowledge in different colleges and universities through Google Cloud/Android Study Jams',
                      context),
                  _buildBulletText('GDG / GDE expert talks', context),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                'GDSC Team',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                itemCount: TeamPage().teamMembers.length,
                itemBuilder: (context, index) {
                  // Extract team member details
                  final member = TeamPage().teamMembers[index];
                  return ListTile(
                    trailing: GestureDetector(
                        onTap: () {
                          openAppWebView(member.connectLink);
                        },
                        child: Text('Connect',
                            style: Theme.of(context).textTheme.displaySmall)),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(member.imageUrl),
                    ),
                    title: Text(member.name),
                    subtitle: Text(member.position),
                  );
                },
              ),
              const SizedBox(height: 20.0),
              Text(
                'How to Join',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletText('Create a Profile', context),
                  _buildBulletText('Join the Chapter', context),
                  _buildBulletText('Get a Confirmation Email', context),
                  _buildBulletText('Attend Events', context),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ElevatedButton(
                      onPressed: () {
                        openAppWebView(
                            'https://gdsc.community.dev/zakir-husain-college-of-engineering-and-technology-aligarh/');
                      },
                      child: const Text('       Join Us       '))),
              const SizedBox(height: 20.0),
              Text(
                'Connect',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: () {
                        openAppWebView('https://www.instagram.com/gdsc_zhcet');
                      },
                      child: Icon(FontAwesomeIcons.instagram)),
                  GestureDetector(
                      onTap: () {
                        openAppWebView(
                            'https://www.youtube.com/channel/UC6mPay3ap1fR_a1eiFA201g');
                      },
                      child: Icon(FontAwesomeIcons.youtube)),
                  GestureDetector(
                      onTap: () {
                        openAppWebView('https://twitter.com/GZhcet');
                      },
                      child: Icon(FontAwesomeIcons.x)),
                  GestureDetector(
                      onTap: () {
                        openAppWebView(
                            'https://www.linkedin.com/company/gdsc-zhcet/');
                      },
                      child: Icon(FontAwesomeIcons.linkedin)),
                  GestureDetector(
                      onTap: () {
                        openAppWebView(
                            'https://gdsc.community.dev/accounts/social/signup/?next=/zakir-husain-college-of-engineering-and-technology-aligarh/');
                      },
                      child: Icon(Icons.mail)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletText(String text, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          const Icon(Icons.arrow_right),
          const SizedBox(width: 5.0),
          Expanded(
            child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
