


import 'package:flutter/material.dart';
import 'package:management_states/library/constant/colors_app.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsApp.liteWhite,
    );
  }
}
