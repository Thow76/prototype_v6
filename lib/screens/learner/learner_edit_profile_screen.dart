import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);

  static const routeName = '/registration';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 0;
  bool isCompleted = false;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final streetNumber = TextEditingController();
  final flatNumber = TextEditingController();
  final streetName = TextEditingController();
  final postcode = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final dateOfBirth = TextEditingController();
  final nationality = TextEditingController();
  final nativeLanguage = TextEditingController();
  final englishLevel = TextEditingController();
  final privacyStatment = TextEditingController();

  List<String> items = [
    'Beginner',
    'Elementary',
    'Pre Intermediate',
    'Intermediate',
    "Don't Know"
  ];
  String? selectedItem;
  bool agree = false;
  final url = Uri.parse(
      'https://project-v1-db-default-rtdb.firebaseio.com/registered-learners.json');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Registration'),
          centerTitle: true,
        ),
        body: isCompleted
            ? buildCompleted()
            : Theme(
                data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                        primary: Color.fromARGB(255, 80, 100, 170))),
                child: Stepper(
                  type: StepperType.vertical,
                  steps: getSteps(),
                  currentStep: currentStep,
                  onStepContinue: () {
                    final isLastStep = currentStep == getSteps().length - 1;

                    if (isLastStep) {
                      setState(() => isCompleted = true);
                      http.post(url,
                          body: jsonEncode({
                            'first name': firstName.text,
                            'last name': lastName.text,
                            'street number': streetNumber.text,
                            'flat number': flatNumber.text,
                            'street name': streetName.text,
                            'postcode': postcode.text,
                            'email': email.text,
                            'phone number': phoneNumber.text,
                            'date of birth': dateOfBirth.text,
                            'nationality': nationality.text,
                            'native language': nativeLanguage.text,
                            'english level': englishLevel.text,
                            'privacy statment': privacyStatment.text,
                          }));

                      /// send data to server
                    } else {
                      setState(() => currentStep += 1);
                    }
                  },
                  onStepTapped: (step) => setState(() => currentStep = step),
                  onStepCancel: currentStep == 0
                      ? null
                      : () => setState(() => currentStep -= 1),
                  controlsBuilder:
                      (BuildContext context, ControlsDetails controls) {
                    final isLastStep = currentStep == getSteps().length - 1;

                    return Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              child: Text(isLastStep ? 'CONFIRM' : 'NEXT'),
                              onPressed: controls.onStepContinue,
                            ),
                          ),
                          const SizedBox(width: 12),
                          if (currentStep != 0)
                            Expanded(
                              child: ElevatedButton(
                                child: const Text('BACK'),
                                onPressed: controls.onStepCancel,
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
      );

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            'Name & Address',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: firstName,
                decoration: const InputDecoration(
                  border: const OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                    const Radius.circular(10.0),
                  )),
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'First Name',
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: lastName,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Surname',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Contact Details'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Email',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: phoneNumber,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Phone Number',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: streetNumber,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Street Number',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: streetName,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Street Name',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: flatNumber,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Flat (if applicable)',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: postcode,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Postcode',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Personal Details'),
          content: Column(
            children: <Widget>[
              TextFormField(
                controller: dateOfBirth,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Date of Birth',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: nationality,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Nationality',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(height: 5),
              TextFormField(
                controller: nativeLanguage,
                decoration: const InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'First Language',
                    floatingLabelBehavior: FloatingLabelBehavior.never),
              ),
              SizedBox(
                height: 5,
              ),
              DropdownButtonFormField<String>(
                value: selectedItem,
                items: items
                    .map(
                      (item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(color: Colors.black54, fontSize: 17),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (item) => setState(() => selectedItem = item),
                decoration: const InputDecoration(
                    // labelText: 'English Level',
                    // labelStyle: TextStyle(color: Colors.black),
                    // helperText: 'English Level',
                    hintText: 'English Level',
                    // helperStyle: TextStyle(color: Colors.white),
                    border: const OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    floatingLabelBehavior: FloatingLabelBehavior.never),
                dropdownColor: Colors.white,
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        Step(
            isActive: currentStep >= 4,
            title: Text('Privacy Statment'),
            content: Checkbox(
                value: agree,
                onChanged: (value) {
                  setState(() {
                    agree = value ?? false;
                  });
                })),
        Step(
          isActive: currentStep >= 3,
          title: Text('Submit'),
          content: Column(
            children: <Widget>[
              buildText('First Name', firstName.text),
              const SizedBox(height: 12),
              buildText('Last Name', lastName.text),
              const SizedBox(height: 12),
              buildText('Street Number', streetNumber.text),
              const SizedBox(height: 12),
              buildText('Street Name', streetName.text),
              const SizedBox(height: 12),
              buildText('Flat', flatNumber.text),
              const SizedBox(height: 12),
              buildText('Postcode', postcode.text),
              const SizedBox(height: 12),
              buildText('Email', email.text),
              const SizedBox(height: 12),
              buildText('Phone Number', phoneNumber.text),
              const SizedBox(height: 12),
              buildText('Date of Birth', dateOfBirth.text),
              const SizedBox(height: 12),
              buildText('Nationality', nationality.text),
              const SizedBox(height: 12),
              buildText('First Language', nativeLanguage.text),
              const SizedBox(height: 12),
              buildText('English Level', englishLevel.text),
            ],
          ),
        ),
      ];

  Widget buildCompleted() => Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 52),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.cloud_done, color: Colors.blue, size: 120),
            const SizedBox(height: 8),
            Text(
              'Registered',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 64),
            ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 80, 100, 170),
                  textStyle: TextStyle(fontSize: 24),
                  minimumSize: Size.fromHeight(50),
                ),
                child: Text('Log In'),
                onPressed: () {}

                // => setState(() {
                //   isCompleted = false;
                //   currentStep = 0;

                //   firstName.clear();
                //   lastName.clear();
                //   streetName.clear();
                //   streetNumber.clear();
                //   flatNumber.clear();
                //   postcode.clear();
                //   email.clear();
                //   phoneNumber.clear();
                //   dateOfBirth.clear();
                //   nationality.clear();
                //   nativeLanguage.clear();
                //   englishLevel.clear();
                // }
                ),
          ],
        ),
      );

  Widget buildText(String title, String value) => Row(
        children: [
          Container(
            width: 140,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      );
}
