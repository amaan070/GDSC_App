// Define a data model for team members
import 'package:flutter/material.dart';

class TeamMember {
  final String name;
  final String position;
  final String imageUrl;
  final String connectLink;

  TeamMember({
    required this.name,
    required this.position,
    required this.imageUrl,
    required this.connectLink,
  });
}

class TeamPage extends StatelessWidget {
  // Dummy data for team members
  final List<TeamMember> teamMembers = [
    TeamMember(
        name: 'Abhishek Singh',
        position: 'GDSC Lead',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/abhishek_singh_snIwYfS.jpg',
        connectLink:
            'https://gdsc.community.dev/u/mydwyr/' // Provide actual image paths or URLs
        ),
    TeamMember(
        name: 'Ale Imran',
        position: 'Faculty Advisor',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/ale_imran.jpg',
        connectLink: 'https://gdsc.community.dev/u/mvpd2u/'),
    TeamMember(
        name: 'Apporve Goyal',
        position: 'Mentor',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/apoorve_goyal.png',
        connectLink: 'https://gdsc.community.dev/u/mrx58p/'),
    TeamMember(
        name: 'Alweera Khan',
        position: 'Mentor',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/alweera_khan.jpeg',
        connectLink: 'https://gdsc.community.dev/u/m4pnuq/'),
    TeamMember(
        name: 'Maaz Bin Asad',
        position: 'Mentor',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/featured_attendees/IMG_20200915_185622.jpg',
        connectLink: 'https://gdsc.community.dev/u/mz5tnv/'),
    TeamMember(
        name: 'Sanjana Maheshwari',
        position: 'Mentor',
        imageUrl:
            'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/sanjana_maheshwari.jpeg',
        connectLink: 'https://gdsc.community.dev/u/mvw4mm/'),
    // Add other team members below
    // Example:
    TeamMember(
      name: 'Faraz Iqbal',
      position: 'Mentor',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/faraz_iqbal.jpg',
      connectLink: 'https://gdsc.community.dev/u/mpc2ck/',
    ),
    TeamMember(
      name: 'Sumir Vats',
      position: 'Mentor',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/sumir_vats.png',
      connectLink: 'https://gdsc.community.dev/u/mnzu54/',
    ),
    TeamMember(
      name: 'Zoya Ahmad',
      position: 'Mentor',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/zoya_ahmad_YEwRXNY.jpg',
      connectLink: 'https://gdsc.community.dev/u/mc8q2u/',
    ),
    TeamMember(
      name: 'Asna Fatimah',
      position: "Volunteer's Team Lead",
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/asna_fatimah_18MInFj.jpg',
      connectLink: 'https://gdsc.community.dev/u/mb9vzq/',
    ),
    TeamMember(
      name: 'Musharraf Abdullah',
      position: 'AI/ML Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/musharraf_abdullah.jpg',
      connectLink: 'https://gdsc.community.dev/u/mztz2b/',
    ),
    TeamMember(
      name: 'Firaas Ahmed Khan',
      position: 'AI/ML TEAM',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/firaas_a_khan_LODMl2w.jpg',
      connectLink: 'https://gdsc.community.dev/u/m9ye7m/',
    ),
    TeamMember(
      name: 'Anaum Khan',
      position: 'AI/ML TEAM',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/anaum_khan_vRjsrjs.jpg',
      connectLink: 'https://gdsc.community.dev/u/mz8a5u/',
    ),
    TeamMember(
      name: 'Fiza Khan',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/fiza_khan_56tRtNk.jpg',
      connectLink: 'https://gdsc.community.dev/u/mgwjec/',
    ),
    TeamMember(
      name: 'Mohammad Ali',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/mohammad_ali_pS3k3pO.jpg',
      connectLink: 'https://gdsc.community.dev/u/mmp3hb/',
    ),
    TeamMember(
      name: 'Sharjeel Afridi',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/sharjeel_afridi.jpg',
      connectLink: 'https://gdsc.community.dev/u/mj4ewu/',
    ),
    TeamMember(
      name: 'Avyukt Soni',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/avyukt_soni_S8pZbRC.JPG',
      connectLink: 'https://gdsc.community.dev/u/m6v8ur/',
    ),
    TeamMember(
      name: 'Rayyan Nafees',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/rayyan_nafees_oEMBl5s.png',
      connectLink: 'https://gdsc.community.dev/u/mnhefv/',
    ),
    TeamMember(
      name: 'Priyanshu Singh',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/priyanshu_singh_oWsTMuu.JPG',
      connectLink: 'https://gdsc.community.dev/u/mzy9cx/',
    ),
    TeamMember(
      name: 'Shahwaiz Islam',
      position: 'Web & Tech Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/22cobea132_shahwaizislam_islam.jpg',
      connectLink: 'https://gdsc.community.dev/u/mct8d9/',
    ),
    TeamMember(
      name: 'Amaan Ahmad',
      position: 'Android Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/amaan_ahmad_S2ltXzh.jpg',
      connectLink: 'https://gdsc.community.dev/u/m6xnyb/',
    ),
    TeamMember(
      name: 'Hazique Khan',
      position: 'Android and UI/UX Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/hazique_khan.jpg',
      connectLink: 'https://gdsc.community.dev/u/m89byt/',
    ),
    TeamMember(
      name: 'Akriti Pundhir',
      position: 'UI/UX Team',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/akriti_pundhir_0cSuOop.jpg',
      connectLink: 'https://gdsc.community.dev/u/mnumbh/',
    ),
    TeamMember(
      name: 'Sheikh Noorul A Usmani',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/featured_attendees/Screenshot%202023-08-26%20at%207.22.04%20PM.png',
      connectLink: 'https://gdsc.community.dev/u/mnfef7/',
    ),
    TeamMember(
      name: 'Mariam Hashmi',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/mariam_hashmi_6eIpVfP.jpg',
      connectLink: 'https://gdsc.community.dev/u/m9uscy/',
    ),
    TeamMember(
      name: 'Suyog Sharma',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/s_s.jpeg',
      connectLink: 'https://gdsc.community.dev/u/m4bc5e/',
    ),
    TeamMember(
      name: 'Maimoona Qadri',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/maimoona_qadri_d31oMI5.jpg',
      connectLink: 'https://gdsc.community.dev/u/m9j5xg/',
    ),
    TeamMember(
      name: 'Nandini Varshney',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/nandini_varshney_NnxEeYS.jpg',
      connectLink: 'https://gdsc.community.dev/u/mp5qsj/',
    ),
    TeamMember(
      name: 'Riya Chaudhary',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/riya_chaudhary_kUrAuky.jpg',
      connectLink: 'https://gdsc.community.dev/u/mjqkv5/',
    ),
    TeamMember(
      name: 'Muneer Kazmi',
      position: 'Volunteer',
      imageUrl:
          'https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/muneer_kazmi_jIjxcdz.jpeg',
      connectLink: 'https://gdsc.community.dev/u/mv7ztx/',
    ),
  ];

  TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
