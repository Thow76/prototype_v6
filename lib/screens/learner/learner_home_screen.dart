import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prototype_v5/screens/learner/widgets/learner_home_layout.dart';

class LearnerHome extends StatelessWidget {
  const LearnerHome({super.key});

  static const routeName = '/learner-home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LearnerHomeLayout(),
    );
  }
}
