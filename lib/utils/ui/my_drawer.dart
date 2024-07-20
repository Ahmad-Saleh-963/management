// ignore_for_file: use_build_context_synchronously


import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/views/auth/login_page.dart';
import 'package:management_states/views/profile/profile_page.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key, required this.width, required this.height});

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 85),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        bottomRight: Radius.circular(20),
      )),
      child: Drawer(
        elevation: 0.0,
        width: width / 1.8,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / 3,
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    tileMode: TileMode.mirror,
                    colors: <Color>[
                      ColorsApp.primaryColor,
                      ColorsApp.primaryColor,
                      ColorsApp.primaryColor,
                      ColorsApp.primaryColor,
                      ColorsApp.linearWhite,
                    ],
                  ),
                  //   borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    SizedBox(
                      height: height /6,
                      width: width,
                      child: Image.asset(ImagesApp.personImage),
                    ),
                    const Text("AHMAD SALEH",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
                    const SizedBox(height: 5),
                    const AutoSizeText("ahmedsaleh405792@gmail.com",style: TextStyle(color: Colors.white,fontSize: 10),),
                  ],
                ),
              ),
              _buildListTile("الإشعارات", Icon(Icons.notifications, color: ColorsApp.primaryColor), () {},),
              Divider(color: ColorsApp.primaryColor.withOpacity(0.1), thickness: 0.5),
              _buildListTile("تسجيل الدخول", Icon(Icons.account_circle_sharp, color: ColorsApp.primaryColor), () {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>  const LogInPage()));
              },),
              Divider(color: ColorsApp.primaryColor.withOpacity(0.1), thickness: 0.5),
              _buildListTile("الإعدادات", Icon(Icons.settings, color: ColorsApp.primaryColor), () {
                Navigator.push(context, MaterialPageRoute(builder:(context) =>  const ProfilePage()));
              },),
              Divider(color: ColorsApp.primaryColor.withOpacity(0.1), thickness: 0.5),

            ],
          ),
        ),
      ),
    );
  }

  txt(String txt) => AutoSizeText(txt,
      textAlign: TextAlign.end,
      maxLines: 1,
      style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15));

  _buildListTile(String title, Icon preIcon, Function onPress) =>
      ListTile(
        onTap: () {
          onPress();
        },
        selectedColor: ColorsApp.primaryColor,
        textColor: ColorsApp.primaryColor,
        title: txt(title),
        leading:   Icon(Icons.arrow_back_ios, color: ColorsApp.primaryColor),
        trailing: preIcon,
      );
}
