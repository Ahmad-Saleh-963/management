// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/localization/generated/l10n.dart';


class ErrorOpenPage extends StatelessWidget {
  const ErrorOpenPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset("assets/images/error.json", height: height / 5),
            AutoSizeText(
              S.current.errorLoadPage,
              style: TextStyle(
                  color: ColorsApp.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
