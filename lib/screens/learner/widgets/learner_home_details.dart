import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:prototype_v5/models/learners/learner.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:date_format/date_format.dart';

class LearnerDetails extends StatefulWidget {
  final Learner? user;

  const LearnerDetails({Key? key, this.user}) : super(key: key);

  @override
  State<LearnerDetails> createState() => _LearnerDetailsState();
}

class _LearnerDetailsState extends State<LearnerDetails> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerDate;

  @override
  void initState() {
    super.initState();

    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerDate = TextEditingController();

    if (widget.user != null) {
      final user = widget.user!;

      controllerName.text = user.firstName!;
      controllerSurname.text = user.surname!;
      // controllerDate.text = Forma
      // ('yyyy-MM-dd').format(user.dateOfBirth);
    }
  }

  @override
  void dispose() {
    controllerName.dispose();
    controllerSurname.dispose();
    controllerDate.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? controllerName.text : 'Add User'),
        actions: [
          if (isEditing)
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                deleteUser(widget.user!);

                final snackBar = SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    'Deleted ${controllerName.text} to Firebase!',
                    style: TextStyle(fontSize: 24),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Navigator.pop(context);
              },
            ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: <Widget>[
            TextFormField(
              controller: controllerName,
              decoration: decoration('Name'),
              validator: (text) =>
                  text != null && text.isEmpty ? 'Not valid input' : null,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: controllerSurname,
              decoration: decoration('Age'),
              keyboardType: TextInputType.number,
              validator: (text) => text != null && int.tryParse(text) == null
                  ? 'Not valid input'
                  : null,
            ),
            const SizedBox(height: 24),
            // DateTimeField(
            //   initialValue: widget.user?.dateOfBirth,
            //   controller: controllerDate,
            //   decoration: decoration('Birthday'),
            //   validator: (dateTime) =>
            //       dateTime == null ? 'Not valid input' : null,
            //   format: DateFormat('yyyy-MM-dd'),
            //   onShowPicker: (context, currentValue) => showDatePicker(
            //     context: context,
            //     firstDate: DateTime(1900),
            //     lastDate: DateTime(2100),
            //     initialDate: currentValue ?? DateTime.now(),
            //   ),
            // ),
            const SizedBox(height: 32),
            ElevatedButton(
              child: Text(isEditing ? 'Save' : 'Create'),
              onPressed: () {
                // final isValid = formKey.currentState!.validate();

                // if (isValid) {
                //   final user = Learner(
                //     uid: '',
                //     firstName: controllerName.text,
                //     surname: controllerName.text,
                //     dateOfBirth: DateTime.parse(controllerDate.text),
                //     flat: '',
                //   );

                //   if (isEditing) {
                //     updateUser(user);
                //   } else {
                //     createUser(user);
                //   }

                //   final action = isEditing ? 'Edited' : 'Added';
                //   final snackBar = SnackBar(
                //     backgroundColor: Colors.green,
                //     content: Text(
                //       '$action ${controllerName.text} to Firebase!',
                //       style: TextStyle(fontSize: 24),
                //     ),
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(snackBar);

                //   Navigator.pop(context);
                // }
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration decoration(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      );

  Future createUser(Learner user) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    // user.uid = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }

  Future updateUser(Learner user) async {
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    final json = user.toJson();
    await docUser.update(json);
  }

  Future deleteUser(Learner user) async {
    /// Reference to document
    final docUser =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

    await docUser.delete();
  }
}
