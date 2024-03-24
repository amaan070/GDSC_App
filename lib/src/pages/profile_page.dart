import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';
import 'package:gdsc_app/src/services/functions/google_authentication/google_authentication.dart';
import 'package:gdsc_app/src/widgets/global/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  Future<void> editField(String field, int maxLength) async {
    String newValue = '';
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text(
                "Edit $field",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              content: TextField(
                maxLength: maxLength,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Enter the new $field',
                ),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                //cancel button
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel')),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(newValue);

                      //update in firestore
                      if (newValue.trim().isNotEmpty) {
                        usersCollection
                            .doc(currentUser!.email)
                            .update({field: newValue});
                      }
                    },
                    child: const Text('Save')),

                //save button
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            leading: const Icon(Icons.pages),
            title: Text(
              'Profile',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 20),
            ),
            actions: [
              SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.asset('assets/images/GDSC-Logo2.png')),
            ],
          ),
          body: StreamBuilder<DocumentSnapshot>(
            stream: usersCollection.doc(currentUser!.email).snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final userData = snapshot.data!.data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      //profile pic
                      CircleAvatar(
                        radius: 70,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      //user Email
                      Text(
                        textAlign: TextAlign.center,
                        currentUser!.email!,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'My Profile',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20),
                      ),

                      TextBox(
                        text: userData['name'],
                        sectionName: 'Username',
                        onPressed: () => editField('name', 50),
                      ),
                      TextBox(
                        text: userData['phone number'],
                        sectionName: 'Phone Number',
                        onPressed: () => editField('phone number', 10),
                      ),
                      TextBox(
                        text: userData['age'],
                        sectionName: 'Age',
                        onPressed: () => editField('age', 2),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LOGOUT',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: const CircleBorder()),
                              onPressed: () {
                                signOut(context);
                                FirebaseService.signOutFromGoogle();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Logged out!'),
                                  backgroundColor:
                                      Color.fromARGB(255, 210, 36, 23),
                                ));
                              },
                              child: Icon(Icons.logout)),
                        ],
                      )
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error : ${snapshot.error}'),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }
}
