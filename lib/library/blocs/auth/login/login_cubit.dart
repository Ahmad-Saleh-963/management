import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:management_states/library/config/routes_names.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:management_states/views/home/home_page.dart';
import 'package:management_states/views/home/level.dart';
import 'package:supabase/supabase.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final FirebaseMessaging _ms = FirebaseMessaging.instance;
  var token ;
  late SupabaseClient supabaseClient;


  LoginCubit() : super(LoginState.initial()){
    supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
  }

  Future login(BuildContext context) async {
    emit(state.copyWith(loading: true));
    if (emailController.text.isEmpty ||
        !emailController.text.contains('@') ||
        !emailController.text.contains('.')) {
      ShowToastHelper.show(S.current.errorEmail, ToastType.error);
    } else if (passwordController.text.isEmpty ||
        passwordController.text.length < 4) {
      ShowToastHelper.show(S.current.errorPassword, ToastType.error);
    }

    try {
      var response = await supabaseClient
          .from('users')
          .select()
          .eq('email', emailController.text)
          .eq('password', passwordController.text);
      if (response.isNotEmpty) {
        UserModel userModel = UserModel.fromJson(response[0]);
        SharedPreferencesHelper.saveUser(userModel);
        await getToken();
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SelectLevel()));
      } else {
        ShowToastHelper.show(S.current.errorDataAuth, ToastType.error);
      }
    } catch (e) {
      ShowToastHelper.show(S.current.noConnection, ToastType.error);
    }
    emit(state.copyWith(loading: false));
  }

  getToken() async{
   try{
     token = await _ms.getToken();
     try {
       await supabaseClient
           .from('users')
           .update({"token":token})
           .eq("id" , SharedPreferencesHelper.getUser()!.id);
     }catch(e){
       ShowToastHelper.show(S.current.errorSetToken, ToastType.info);
     }
   }catch(e){}
  }

 void navigatorByRoleUser(context, UserModel userModel) {
    if (userModel.roleUser == RoleUser.admin) {
      Navigator.popAndPushNamed(context, RoutesNames.homePage);
    } else {
      Navigator.popAndPushNamed(context, RoutesNames.homePage);
    }
  }
}
