
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:management_states/library/config/routes_names.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/library/utils/toast_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:management_states/views/home/home_page.dart';
import 'package:management_states/views/map/map_page.dart';
import 'package:supabase/supabase.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginCubit() : super(LoginState.initial());

  Future login(BuildContext context) async {
    emit(state.copyWith(loading: true));
    if (emailController.text.isEmpty || !emailController.text.contains('@') || !emailController.text.contains('.')) {
      ShowToastHelper.show(S.current.errorEmail, ToastType.error);
    }
    else
    if (passwordController.text.isEmpty || passwordController.text.length < 4) {
      ShowToastHelper.show(S.current.errorPassword, ToastType.error);
    }

    SupabaseClient supabaseClient = SharedPreferencesHelper
        .getInstanceSupabase();
    try{
      var response = await supabaseClient.from('users').select().eq('email', emailController.text).eq('password', passwordController.text);
      UserModel userModel = UserModel.fromJson(response[0]);
      SharedPreferencesHelper.saveUser(userModel);
      Navigator.push(context,MaterialPageRoute(builder: (context) => const MapPage()));
    }catch(e){
      ShowToastHelper.show(S.current.noConnection,ToastType.error);
    }
    emit(state.copyWith(loading: false));
  }

  navigatorByRoleUser(context,UserModel userModel){
    if(userModel.roleUser == RoleUser.admin){
      Navigator.popAndPushNamed(context,RoutesNames.homePage);
    }else{
      Navigator.popAndPushNamed(context,RoutesNames.homePage);
    }
  }

}
