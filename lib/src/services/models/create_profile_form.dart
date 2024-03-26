// ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/pages/bottom_navigation.dart';

class CreateProfileForm extends StatefulWidget {
  const CreateProfileForm({
    super.key,
  });

  @override
  State<CreateProfileForm> createState() => _CreateProfileFormState();
}

TextEditingController emailController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController ageController = TextEditingController();
final formKey = GlobalKey<FormState>();
var isObscured;

class _CreateProfileFormState extends State<CreateProfileForm> {
  @override
  void initState() {
    isObscured = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: 'Full Name',
                hintText: 'name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'E-Mail',
                hintText: 'e-mail',
                border: OutlineInputBorder(),
              ),
              autofillHints: const [AutofillHints.email],
              validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 2,
              controller: ageController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.data_object),
                labelText: 'Age',
                hintText: 'age',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              maxLength: 10,
              controller: phoneNumberController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.numbers),
                labelText: 'Phone No.',
                hintText: '+91-xxxxxxxxxx',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final form = formKey.currentState;
                    if (form!.validate()) {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser!.email!)
                          .set({
                        'name': usernameController.text.trim(),
                        'phone number': phoneNumberController.text.trim(),
                        'email': emailController.text.trim(),
                        'age': ageController.text.trim()
                      });
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNavigator()));
                    }
                  },
                  child: const Text('CREATE PROFILE')),
            ),
          ],
        ),
      ),
    );
  }
}
