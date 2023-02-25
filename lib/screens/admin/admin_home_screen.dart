// import 'package:flutter/material.dart';
// import 'package:project_v22/screens/add_to_class_screen_cart.dart';
// import 'package:project_v22/widgets/app_drawer.dart';
// import '../widgets/listview_provider.dart';
// import 'package:provider/provider.dart';
// import '../widgets/badge.dart';
// import '../providers/add_to_class_cart.dart';

// enum FilterOptions {
//   Selected,
//   All,
// }

// class LearnerListView extends StatefulWidget {
//   static const routeName = 'learner-list-overview';

//   @override
//   State<LearnerListView> createState() => _LearnerListViewState();
// }

// class _LearnerListViewState extends State<LearnerListView> {
//   var _selectedOnly = false;
//   @override
//   Widget build(BuildContext context) {
//     // final selectedLearner = Provider.of<Learners>(context);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Registered Learners',
//             style: Theme.of(context).textTheme.bodyText1),
//         actions: <Widget>[
//           Consumer<ClassParticipant>(
//             builder: (_, learnerData, ch) => Badge(
//               child: ch as Widget,
//               value: learnerData.learnerCount.toString(),
//               color: Colors.blue,
//             ),
//             child: IconButton(
//               icon: Icon(Icons.class_outlined),
//               onPressed: () {
//                 Navigator.of(context).pushNamed(CreateClassFromList.routeName);
//               },
//             ),
//           ),
//           PopupMenuButton(
//               onSelected: (FilterOptions selectedValue) {
//                 setState(() {
//                   if (selectedValue == FilterOptions.Selected) {
//                     _selectedOnly = true;
//                   } else {
//                     _selectedOnly = false;
//                     // selectedLearner.showSelectedAll();
//                   }
//                 });
//               },
//               icon: Icon(Icons.more_vert),
//               itemBuilder: (_) => [
//                     PopupMenuItem(
//                       child: Text('Selected'),
//                       value: FilterOptions.Selected,
//                     ),
//                     PopupMenuItem(
//                       child: Text('All'),
//                       value: FilterOptions.All,
//                     )
//                   ]),
//         ],
//       ),
//       drawer: AppDrawer(),
//       body: ListViewGrid(_selectedOnly),
//     );
//   }
// }
