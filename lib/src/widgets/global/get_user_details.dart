import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetUserDetail extends StatelessWidget {
  const GetUserDetail({
    super.key,
    required this.docId,
    required this.num,
  });
  final String docId;
  final int num;
  @override
  Widget build(BuildContext context) {
    //get the collection
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(docId).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              '${data['name']}, ${data['age']}, ${data['email']}',
              style: Theme.of(context).textTheme.displaySmall,
            );
          }
          return const Text('loading....');
        }));
  }
}
