import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController matherNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  RegisterCubit() : super(RegisterState.initial());

  Future register(BuildContext context) async {

      if (emailController.text.isEmpty || !emailController.text.contains('@') || !emailController.text.contains('.')) {
        ShowToastHelper.show(S.current.errorEmail, ToastType.error);
        return;
      }else if (fatherNameController.text.isEmpty) {
        ShowToastHelper.show(S.current.errorPassword, ToastType.error);
        return;
      } else if (passwordController.text.isEmpty || passwordController.text.length < 4) {
        ShowToastHelper.show(S.current.errorPassword, ToastType.error);
        return;
      }  else if (selectedDate == null) {
        ShowToastHelper.show(S.current.mustSelectDate, ToastType.error);
        return;
      }

      emit(state.copyWith(login: true));
      SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
      try{
        var response = await supabaseClient.from('users').select().eq('email', emailController.text);
        if(response.isNotEmpty){
          ShowToastHelper.show(S.current.emailAlreadyFound, ToastType.error);
        }else{
          try{
            var response = await supabaseClient.from('users').insert({
              "name":nameController.text,
              "lastName":lastController.text,
              "email":emailController.text,
              "password":passwordController.text,
              "matherName":matherNameController.text,
              "fatherName":fatherNameController.text,
              "isBand":false,
              "type":"user",
              "token":"-",
              "birth":selectedDate.toString(),
            });
            if(response == null){
              ShowToastHelper.show(S.current.processSuccess, ToastType.success);
              Navigator.pop(context);
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
    emit(state.copyWith(login: false));
    }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      locale: const Locale('en'), // Arabic locale
    );

    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        dateController.text = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        emit(state.copyWith(date: DateTime.now().toString()));
    }
  }

}

