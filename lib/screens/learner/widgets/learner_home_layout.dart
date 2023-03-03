import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/models/learners/learner.dart';
import 'package:prototype_v5/services/authentication/auth.dart';
import 'package:prototype_v5/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class LearnerHomeLayout extends StatelessWidget {
  LearnerHomeLayout({super.key});

  final _usersStream = FirebaseFirestore.instance
      .collection('learners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final authUser = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('My Home'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => authUser.logout(),
            )
          ],
        ),
        drawer: AppDrawer(),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }
            Map<String, dynamic> data =
                snapshot.data!.data()! as Map<String, dynamic>;
            return Text(data['email']);
          },
        ));
  }
}

//       buildSingleUser(),
  //       floatingActionButton: FloatingActionButton(
  //         child: Icon(Icons.add),
  //         onPressed: () {
  //           // Navigator.of(context).push(MaterialPageRoute(
  //           //   builder: (context) => (),
  //           // ));
  //         },
  //       ));
  // }

  // Widget buildUser(Learner user) => ListTile(
  //       title: Text(user.firstName!),
  //       subtitle: Text(user.surname!),
  //     );

  // Future<Learner?> readUser(Learner user) async {
  //   /// Get single document by ID
  //   final docUser =
  //       FirebaseFirestore.instance.collection('learners').doc(user.uid);
  //   final snapshot = await docUser.get();

  //   if (snapshot.exists) {
  //     return Learner.fromJson(snapshot.data()!);
  //   }
  // }

  // Widget buildSingleUser() =>
      


  // Widget buildSingleUser() => FutureBuilder<Learner?>(
  //       future: readUser(),
  //       builder: (context, snapshot) {
  //         if (snapshot.hasError) {
  //           return Text('Something went wrong! ${snapshot.error}');
  //         } else if (snapshot.hasData) {
  //           final user = snapshot.data;

  //           return user == null
  //               ? Center(child: Text('No User'))
  //               : buildUser(user);
  //         } else {
  //           return Center(child: CircularProgressIndicator());
  //         }
  //       },
  //     );
  