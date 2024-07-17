import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? roleUser;
  RegisterCubit() : super(RegisterState.initial());

  Future register(BuildContext context) async {

      if (emailController.text.isEmpty || !emailController.text.contains('@') || !emailController.text.contains('.')) {
        ShowToastHelper.show(S.current.errorEmail, ToastType.error);
        return;
      }
      else if (passwordController.text.isEmpty || passwordController.text.length < 4) {
        ShowToastHelper.show(S.current.errorPassword, ToastType.error);
        return;
      } else {
        roleUser ??= 'user';
      }

      emit(state.copyWith(loading: true));
      SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
      try{
        var response = await supabaseClient.from('users').select().eq('email', emailController.text);
        if(response.isNotEmpty){
          ShowToastHelper.show(S.current.emailAlreadyFound, ToastType.error);
        }else{
          try{
            var response = await supabaseClient.from('users').insert({
              "name":nameController.text,
              "email":emailController.text,
              "password":passwordController.text,
              "phone":phoneController.text,
              "matherName":'-',
              "fatherName":'-',
              "isBand":false,
              "type":roleUser,
            });
            if(response == null){
              ShowToastHelper.show(S.current.processSuccess, ToastType.success);
              if(SharedPreferencesHelper.getUser() != null){
                Navigator.pop(context);
              }
            }else{
              ShowToastHelper.show(S.current.errorCreateAccount, ToastType.error);
            }
          }catch(e){
            ShowToastHelper.show(S.current.errorCreateAccount, ToastType.error);
          }
        }
      }catch(e){
        ShowToastHelper.show(S.current.noConnection,ToastType.error);
      }
    emit(state.copyWith(loading: false));
    }


}

