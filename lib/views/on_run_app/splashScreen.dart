// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:management_states/library/config/routes_names.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void getData()async{
    Future.delayed(const Duration(seconds:2)).then((value) {
     UserModel? userModel = SharedPreferencesHelper.getUser();
     if(userModel != null){
       context.goNamed(RoutesNames.homePage);
     }else{
       context.goNamed(RoutesNames.logInPage);
     }
   });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      body:Center(child: Image.asset("assets/images/logo.png",width:width/2,)),
    );
  }
}