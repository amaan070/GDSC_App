// ignore_for_file: prefer_typing_uninitialized_variables

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
  });

  @override
  State<SignupForm> createState() => _SignupFormState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController phoneNumberController = TextEditingController();
TextEditingController ageController = TextEditingController();
final formKey = GlobalKey<FormState>();
var isObscured;

class _SignupFormState extends State<SignupForm> {
  @override
  void initState() {
    isObscured = true;
    super.initState();
  }

  // Future addUserDetails() async {
  //   await FirebaseFirestore.instance.collection('users').add({
  //     'name': usernameController.text.trim(),
  //     'age': int.parse(ageController.text.trim()),
  //     'email': emailController.text.trim(),
  //     'phone number': int.parse(phoneNumberController.text.trim()),
  //   });
  // }

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
            TextFormField(
              obscureText: isObscured,
              controller: passwordController,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: 'Password',
                  hintText: 'password',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isObscured = !isObscured;
                        });
                      },
                      icon: isObscured
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off))),
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
                      //create user
                      createUserWithEmailAndPassword(
                          emailController.text.trim(),
                          passwordController.text.trim(),
                          context,
                          phoneNumberController.text.trim(),
                          usernameController.text.trim(),
                          ageController.text.trim());
                    }
                  },
                  child: const Text('SIGNUP')),
            ),
          ],
        ),
      ),
    );
  }
}
