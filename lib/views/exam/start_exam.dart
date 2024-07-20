


import 'package:flutter/material.dart';
import 'package:management_states/library/data_structure/init_exam/init_exam_model.dart';

class StartExam extends StatefulWidget {
  const StartExam({super.key,required this.initExam});
  final InitExamModel? initExam;
  @override
  State<StartExam> createState() => _StartExamState();
}

class _StartExamState extends State<StartExam> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("sartttttttttttt"),
          )
        ],
      ),
    );
  }
}
