
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/config/messenger.dart';
import 'package:management_states/library/data_structure/states/states.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'list_states_state.dart';

class ListStatesBloc extends Cubit<ListStatesState> with Messenger {
  List<StatesModel> statesPersonal = [];

  ListStatesBloc() : super(ListStatesState.initial()) {}

  Future getStatesPersonal() async {
    emit(state.copyWith(loading: true));
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    try{
      var response = await supabaseClient.from('states').select();
      print(response);
      if(response.isNotEmpty){
        statesPersonal.clear();
        for(var state in response){
          statesPersonal.add(StatesModel.fromJson(state));
        }
      }
    }catch(e){
      print(e);
      ShowToastHelper.show(S.current.noConnection,ToastType.error);
    }
    emit(state.copyWith(loading: false));
  }

  Future deleteStatePersonal(StatesModel statesModel) async {
    statesModel.deleting = true;
    emit(state.copyWith(date: DateTime.now().toString()));
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    try{
      var response = await supabaseClient.from('states').delete().eq('id',statesModel.id);
      if(response == null){
        statesPersonal.removeWhere((element) => element.id == statesModel.id);
        ShowToastHelper.show(S.current.processSuccess,ToastType.success);
      }else{
        ShowToastHelper.show(S.current.processError,ToastType.error);
      }
    }catch(e){
      ShowToastHelper.show(S.current.processError,ToastType.error);
    }
    statesModel.deleting = false;
    emit(state.copyWith(date: DateTime.now().toString()));
  }

  @override
  void onMessage(String key, messageValue) {
  }



}
