// import 'package:flutter/material.dart';
// import 'package:project_v22/providers/add_to_class_cart.dart';
// import 'package:provider/provider.dart';
// import '../models/learner.dart';
// import '../screens/learner_full_details.dart';
// import '../providers/learner_providers.dart';
// import '../screens/add_to_class_screen_cart.dart';

// class ListViewLayout extends StatelessWidget {
//   // final String firstName;
//   // final String surname;
//   // final String email;
//   // final String phoneNumber;
//   // final String englishLevel;

//   // const ListViewLayout(this.firstName, this.surname, this.email,
//   //     this.phoneNumber, this.englishLevel);

//   @override
//   Widget build(BuildContext context) {
//     final learners = Provider.of<Learner>(context, listen: false);
//     final addLearner = Provider.of<ClassParticipant>(context, listen: false);
//     final searchLearner = Provider.of<Learners>(context, listen: false);

//     return ClipRRect(
//         borderRadius: BorderRadius.circular(25),
//         child: Container(
//             height: 150,
//             margin: EdgeInsets.all(5),
//             color: Colors.amber,
//             child: Stack(children: <Widget>[
//               Positioned(
//                 child: Card(
//                     color: Color.fromARGB(255, 57, 50, 91),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10)),
//                     // onTap: () {
//                     //   Navigator.of(context).pushNamed(LearnerDetails.routeName,
//                     //       arguments: learners.firstName);
//                     // },
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.of(context).pushNamed(
//                             LearnerDetails.routeName,
//                             arguments: learners.firstName);
//                       },
//                       child: Container(
//                         width: 300,
//                         padding: EdgeInsets.all(10),
//                         child: Column(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                               Text(
//                                   'Name:' +
//                                       ' ' +
//                                       learners.firstName +
//                                       ' ' +
//                                       learners.lastName,
//                                   style: Theme.of(context).textTheme.bodyText2),
//                               Text('Postcode:' + ' ' + "${learners.postcode}"),
//                               Text('Email:' + ' ' + learners.email,
//                                   style: Theme.of(context).textTheme.bodyText2),
//                               Text('Tel:' + ' ' + learners.phoneNumber,
//                                   style: Theme.of(context).textTheme.bodyText2),
//                               Text(
//                                   'English Level:' +
//                                       ' ' +
//                                       learners.englishLevel,
//                                   style: Theme.of(context).textTheme.bodyText2)
//                             ]),
//                       ),
//                     )),
//               ),
//               Positioned(
//                 right: 10,
//                 bottom: 4,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                       height: 50,
//                       width: 50,
//                       color: Color.fromARGB(
//                         255,
//                         57,
//                         50,
//                         91,
//                       ),
//                       child: Consumer<Learner>(
//                         builder: (context, learner, _) => IconButton(
//                           color: Colors.white,
//                           icon: Icon(
//                             learners.isSelected
//                                 ? Icons.check_box
//                                 : Icons.check_box_outline_blank,
//                           ),
//                           onPressed: () {
//                             learners.toggleSelectedStatus();
//                           },
//                         ),
//                       )),
//                 ),
//               ),
//               Positioned(
//                 top: 4,
//                 right: 10,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Container(
//                     height: 50,
//                     width: 50,
//                     color: Color.fromARGB(255, 57, 50, 91),
//                     //child: Consumer<Learner>(
//                     // builder: (context, learner, _) =>
//                     child: IconButton(
//                         color: Colors.white,
//                         icon: Icon(Icons.add_box),
//                         onPressed: () {
//                           // if (learners.learnerId
//                           //     .contains(searchLearner.details.toString())) {
//                           //   showDialog(
//                           //       context: context,
//                           //       builder: (ctx) => AlertDialog(
//                           //               title: Text(
//                           //                   'Learner has already been added to the class'),
//                           //               actions: [
//                           //                 TextButton(
//                           //                   onPressed: Navigator.of(ctx).pop,
//                           //                   child: Text('Close',
//                           //                       style: TextStyle(
//                           //                           color: Color.fromARGB(
//                           //                               255, 57, 50, 91))),
//                           //                 )
//                           //               ]));
//                           // } else {
//                           addLearner.addLearner(
//                             //learner variable connects to Provider.of for Learner Class
//                             learners.learnerId,
//                             learners.firstName,
//                             learners.lastName,
//                             learners.englishLevel,
//                             learners.nationality,
//                           );

//                           //}
//                           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                               content: Text('Learner Added',
//                                   textAlign: TextAlign.left),
//                               duration: Duration(seconds: 3),
//                               action: SnackBarAction(
//                                 label: 'UNDO',
//                                 onPressed: () {
//                                   addLearner
//                                       .removeSingleItem(learners.learnerId);
//                                 },
//                               )));
//                         }),
//                   ),
//                 ),
//               ),
//             ])));
//   }
// }
