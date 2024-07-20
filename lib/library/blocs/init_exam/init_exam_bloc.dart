import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/data_structure/init_exam/init_exam_model.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'init_exam_state.dart';

class InitExamBloc extends Cubit<InitExamState> {
  late UserModel user;
  late SupabaseClient supabaseClient;
  InitExamModel? initExam;
  StreamSubscription? subscription;

  InitExamBloc() : super(InitExamState.initial()) {
    supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    user = SharedPreferencesHelper.getUser()!;
  }


  void getTheExam(int level)async{
    emit(state.copyWith(loading: true,hasError: false));

    try {
      var response = await supabaseClient.from('exam').select().eq("level",level);
      if (response.isNotEmpty) {
        initExam = InitExamModel.fromJson(response[0]);
        emit(state.copyWith(loading: false,hasError: false,hasExam: true));
        return;
      }else{
        emit(state.copyWith(loading: false,hasError: false,hasExam: false));
        return;
      }
    } catch (e) {
      ShowToastHelper.show(S.current.noConnection, ToastType.error);
      emit(state.copyWith(loading: false,hasError: true));
      return;
    }
  }

  void initRealTime(int level){
    subscription = supabaseClient
        .from('exam').stream(primaryKey: ['id']).eq('level', level)
        .listen((event) {
      initExam = InitExamModel.fromJson(event[0]);
      emit(state.copyWith(date: DateTime.now().toString()));
    });
  }

}