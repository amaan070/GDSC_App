// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/pages/bottom_navigation.dart';
import 'package:gdsc_app/src/auth/email_verification/email_verification.dart';
// import 'package:gdsc_app/src/features/authentication/screens/login_screen.dart';

createUserWithEmailAndPassword(
    String emailAddress,
    String password,
    BuildContext context,
    String phoneNumber,
    String userName,
    String age) async {
  //loading circle
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    //user data in database
    FirebaseFirestore.instance
        .collection('users')
        .doc(credential.user!.email)
        .set({
      'name': userName,
      'phone number': phoneNumber,
      'email': emailAddress,
      'age': age
    });
    User? user = credential.user;

    if (user != null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const VerifyEmail()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Signup Successful! Verify your Email to Login!'),
        backgroundColor: Color.fromARGB(255, 23, 154, 27),
      ));
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e.message.toString()),
      backgroundColor: const Color.fromARGB(255, 210, 36, 23),
    ));
  } catch (e) {
    print(e);
  }
}

signInWithEmailAndPassword(
    String emailAddress, String password, BuildContext context) async {
  //loading circle
  showDialog(
      context: context,
      builder: (context) {
        return const Center(child: CircularProgressIndicator());
      });

  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    User? user = credential.user;
    if (user != null) {
      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const BottomNavigator()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Logged into your account successfully.'),
          backgroundColor: Color.fromARGB(255, 23, 154, 27),
        ));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const VerifyEmail()));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Verify your email first. New verification link sent!'),
          backgroundColor: Color.fromARGB(255, 210, 36, 23),
        ));
      }
    }
  } on FirebaseAuthException catch (e) {
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e.message.toString()),
      backgroundColor: const Color.fromARGB(255, 210, 36, 23),
    ));
    print('Error : $e');
  }
}

//reset password with email method
passwordReset(String emailAddress, BuildContext context) async {
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress);
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Password reset link sent! Check you email!'),
      backgroundColor: Color.fromARGB(255, 23, 154, 27),
    ));
  } on FirebaseAuthException catch (e) {
    print(e);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e.message.toString()),
      backgroundColor: const Color.fromARGB(255, 210, 36, 23),
    ));
  }
}

//sign out method
signOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();
  Navigator.pop(context);
}
