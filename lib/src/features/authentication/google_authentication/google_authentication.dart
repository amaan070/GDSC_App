// ignore_for_file: use_build_context_synchronously, body_might_complete_normally_nullable, use_rethrow_when_possible

import 'package:firebase_auth/firebase_auth.dart';
import 'package:gdsc_app/src/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class FirebaseService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final GoogleSignIn _googleSignIn = GoogleSignIn();

  static Future<String?> signInwithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'title')));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Logged into your account successfully.'),
        backgroundColor: Color.fromARGB(255, 23, 154, 27),
      ));
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      (e.message);
      throw e;
    }
  }

  static Future<void> signOutFromGoogle() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
