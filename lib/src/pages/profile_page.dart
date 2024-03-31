import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gdsc_app/src/services/firebase/firebase_functions.dart';
import 'package:gdsc_app/src/widgets/global/text_box.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  File? _image;
  NetworkImage? img;
  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    checkIfImageExists();
  }

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    setState(() async {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
        bool success = await uploadFileForUser(_image!);
        print(success);
        checkIfImageExists();
      } else {
        print('no image');
      }
    });
  }

  Future<bool> uploadFileForUser(File file) async {
    try {
      final userEmail = FirebaseAuth.instance.currentUser!.email;
      final storageRef = FirebaseStorage.instance.ref();
      final uploadRef = storageRef.child("$userEmail/uploads/profileImage.jpg");
      await uploadRef.putFile(file);
      return true;
    } catch (e) {
      print(e);
    } finally {}
    return false;
  }

  Future<void> checkIfImageExists() async {
    try {
      final userEmail = FirebaseAuth.instance.currentUser!.email;
      final ref = FirebaseStorage.instance
          .ref()
          .child("$userEmail/uploads/profileImage.jpg");
      final String downloadUrl = await ref.getDownloadURL();
      setState(() {
        img = NetworkImage(downloadUrl);
      });
    } catch (e) {
      print('Error checking image: $e');
    } finally {}
  }

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
                child: Image.asset('assets/images/GDSC-Logo2.png'),
              ),
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
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Theme.of(context).colorScheme.secondary),
                        child: Text(
                          textAlign: TextAlign.center,
                          currentUser!.email!,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ),
                      //profile pic
                      const SizedBox(
                        height: 15,
                      ),
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: img == null ? null : img,
                        child: img == null
                            ? FloatingActionButton(
                                child: const Icon(Icons.add),
                                onPressed: () {
                                  getImage();
                                },
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: const Icon(
                              Icons.change_circle_outlined,
                              size: 30,
                            ),
                            onTap: () => getImage(),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            child: Text(
                              'Change Image',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(fontSize: 12.5),
                            ),
                            onTap: () => getImage(),
                          ),
                        ],
                      ),
                      //user Email
                      const SizedBox(
                        height: 20,
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
                        height: 15,
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
                                signOutFromGoogle();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('Logged out!'),
                                  backgroundColor:
                                      Color.fromARGB(255, 210, 36, 23),
                                ));
                              },
                              child: const Icon(Icons.logout)),
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
