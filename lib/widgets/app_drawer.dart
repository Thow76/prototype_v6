import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.info,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          title: Text('About'),
          onTap: () {
            // Navigator.of(context).pushReplacementNamed(ClassListView.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.password,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          title: Text('Change Password'),
          onTap: () {
            // Navigator.of(context)
            // .pushReplacementNamed(LearnerListView.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.account_box_outlined,
            color: Theme.of(context).appBarTheme.foregroundColor,
          ),
          title: Text('Delete Account'),
          onTap: () {
            // Navigator.of(context).pushReplacementNamed(CreateClass.routeName);
          },
        ),
      ]),
    );
  }
}
