import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/models/learners/learner.dart';
import 'package:prototype_v5/screens/learner/learner_edit_profile_screen.dart';
import 'package:prototype_v5/screens/learner/widgets/learner_home_details.dart';
import 'package:prototype_v5/services/authentication/auth.dart';
import 'package:prototype_v5/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class LearnerHomeLayoutCopy extends StatelessWidget {
  LearnerHomeLayoutCopy({super.key});

  final _learnerStream = FirebaseFirestore.instance
      .collection('learners')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .snapshots();
  final learnerDetails = FirebaseFirestore.instance.collection('learners');

  final String pleaseRegister = 'Please Register';

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
        body: Column(children: <Widget>[
          StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: _learnerStream,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading");
                }
                Map<String, dynamic> data =
                    snapshot.data!.data()! as Map<String, dynamic>;
                return Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 173, 48, 48),
                      child: Text(
                        'Status: ${data['learner status']}',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      color: const Color.fromARGB(255, 224, 178, 40),
                      child: Text(
                        "Email: ${authUser.email() as String}",
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(children: <Widget>[
                        Positioned(
                          child: Card(
                              color: const Color.fromARGB(255, 57, 50, 91),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              // onTap: () {
                              //   Navigator.of(context).pushNamed(LearnerDetails.routeName,
                              //       arguments: learners.firstName);
                              // },
                              child: InkWell(
                                onTap: () {
                                  // Navigator.of(context).pushNamed(
                                  //     LearnerDetails.routeName,
                                  //     arguments: learners.firstName);
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(15),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                            'Name: ${data['first name']} ${data['surname']}',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            'Address: ${data['street number']} ${data['street name']}',
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('Tel: ${data['phone number']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('Postcode: ${data['postcode']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            'Nationality: ${data['nationality']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            'Native Language: ${data['native language']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            'Native Language: ${data['native language']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                            'Native Language: ${data['date of birth']}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1),
                                      ]),
                                ),
                              )),
                        ),
                        Positioned(
                          top: 4,
                          right: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 50,
                              width: 50,
                              color: const Color.fromARGB(255, 57, 50, 91),
                              child: (IconButton(
                                color: Colors.white,
                                icon: const Icon(
                                  Icons.edit,
                                ),
                                onPressed: () {},
                              )),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ],
                );
              }),
          const SizedBox(
            height: 150,
          ),
          ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(RegistrationScreen.routeName);
              }),
              child: const Text('Register'))
        ]));
  }
}
