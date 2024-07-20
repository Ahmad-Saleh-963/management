



import 'package:flutter/material.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/views/exam/init_exam.dart';

class SelectLevel extends StatelessWidget {
  const SelectLevel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Text("إختر المستوى"),
          const SizedBox(height: 25),
          _buildButtonLogIn(context,1),
          const SizedBox(height: 10),
          _buildButtonLogIn(context,2),
          const SizedBox(height: 10),
          _buildButtonLogIn(context,3),
          const SizedBox(height: 10),
          _buildButtonLogIn(context,4),
          const SizedBox(height: 10),
          _buildButtonLogIn(context,5),
          const SizedBox(height: 10),
          _buildButtonLogIn(context,6),
        ],
      ),
    );
  }


  Widget _buildButtonLogIn(BuildContext context , int level ) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
        width: 200,
        height: 40,
        child: MaterialButton(
          onPressed: () async {
            Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => InitExamPage(level: level)), (route) => false);
          },
          color: ColorsApp.primaryColor,
          highlightColor: Colors.transparent,
          enableFeedback: false,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            "$level",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontFamily: "Al-Jazeera"),
          ),
        ),
      ),
    );
  }

}
