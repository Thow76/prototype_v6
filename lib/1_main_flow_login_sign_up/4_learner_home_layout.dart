// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:prototype_v5/services/authentication/auth.dart';
// import 'package:prototype_v5/widgets/app_drawer.dart';
// import 'package:provider/provider.dart';

// class LearnerHomeLayout extends StatelessWidget {
//   const LearnerHomeLayout({super.key});

//   final String learnerName = 'André Shevchenko';
//   final String learnerAddress = 'Please Register';
//   final String learnerPostcode = 'Please Register';
//   final String learnerEmail = 'thow1976@gmx.co.uk';
//   final String learnerPhone = '08909388999';
//   final String learnerStatus = 'Signed Up';

//   @override
//   Widget build(BuildContext context) {
//     final authUser = Provider.of<AuthService>(context, listen: false);
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('My Home'),
//         ),
//         drawer: AppDrawer(),
//         body: Column(children: <Widget>[
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             color: const Color.fromARGB(255, 173, 48, 48),
//             child: Text(
//               'Status: $learnerStatus',
//               style: Theme.of(context).textTheme.headline3,
//             ),
//           ),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(20),
//             color: const Color.fromARGB(255, 224, 178, 40),
//             child: Text(
//               learnerName,
//               style: Theme.of(context).textTheme.headline3,
//             ),
//           ),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(25),
//             child: Stack(children: <Widget>[
//               Positioned(
//                 child: Card(
//                     color: const Color.fromARGB(255, 57, 50, 91),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     // onTap: () {
//                     //   Navigator.of(context).pushNamed(LearnerDetails.routeName,
//                     //       arguments: learners.firstName);
//                     // },
//                     child: InkWell(
//                       onTap: () {
//                         // Navigator.of(context).pushNamed(
//                         //     LearnerDetails.routeName,
//                         //     arguments: learners.firstName);
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         padding: const EdgeInsets.all(15),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text('Address: $learnerAddress',
//                                   style: const TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.bold,
//                                   ).copyWith(color: Colors.red)),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Text('Postcode: $learnerPostcode',
//                                   style: const TextStyle(
//                                     fontSize: 18.0,
//                                     fontWeight: FontWeight.bold,
//                                   ).copyWith(color: Colors.red)),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Text('Email: $learnerEmail',
//                                   style: Theme.of(context).textTheme.bodyText1),
//                               const SizedBox(
//                                 height: 20,
//                               ),
//                               Text('Tel: $learnerPhone',
//                                   style: Theme.of(context).textTheme.bodyText1),
//                             ]),
//                       ),
//                     )),
//               ),
//               Positioned(
//                 top: 4,
//                 right: 10,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     color: const Color.fromARGB(255, 57, 50, 91),
//                     child: (IconButton(
//                       color: Colors.white,
//                       icon: const Icon(
//                         Icons.edit,
//                       ),
//                       onPressed: () {},
//                     )),
//                   ),
//                 ),
//               )
//             ]),
//           ),
//           const SizedBox(
//             height: 300,
//           ),
//           ElevatedButton(onPressed: (() {}), child: Text('Register'))
//         ]));
//   }
// }
