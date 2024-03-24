// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/auth/reset/reset_options.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
final formKey = GlobalKey<FormState>();
var isObscured;

class _LoginFormState extends State<LoginForm> {
  bool isEmailVerified = false;

  @override
  void initState() {
    isObscured = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
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
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        resetOptions(context);
                      },
                      child: const Text('Forgot Password?'))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      final form = formKey.currentState;
                      if (form!.validate()) {
                        signInWithEmailAndPassword(emailController.text.trim(),
                            passwordController.text.trim(), context);
                      }
                    },
                    child: const Text('LOGIN')),
              ),
            ],
          ),
        ));
  }
}
