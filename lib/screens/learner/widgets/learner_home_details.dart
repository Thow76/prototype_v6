import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prototype_v5/models/learners/learner.dart';
import 'package:prototype_v5/screens/learner/widgets/learner_home_layout.dart';
import 'package:provider/provider.dart';

class LearnerDetails extends StatefulWidget {
  LearnerDetails({super.key});

  @override
  State<LearnerDetails> createState() => _LearnerDetailsState();
}

class _LearnerDetailsState extends State<LearnerDetails> {
  @override
  Widget build(BuildContext context) {
    final learnerDetails = Provider.of<List<LearnerView>>(context);

    return ListView.builder(
      itemCount: learnerDetails.length,
      itemBuilder: (context, index) {
        return LearnerHomeLayout();
      },
    );
  }
}
