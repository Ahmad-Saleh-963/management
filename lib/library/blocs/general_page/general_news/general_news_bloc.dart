import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/data_structure/news/news.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/toast.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'general_news_state.dart';

class GeneralNewsBloc extends Cubit<GeneralNewsState> {
  List<NewsModel> news = [];

  GeneralNewsBloc() : super(GeneralNewsState.initial()) {}

  Future getNews() async {
    emit(state.copyWith(loading: true));
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    try{
      var response = await supabaseClient.from('news').select();
      if(response.isNotEmpty){
        news.clear();
        for(var state in response){
          news.add(NewsModel.fromJson(state));
        }
      }
    }catch(e){
      ShowToastHelper.show(S.current.noConnection,ToastType.error);
    }
    emit(state.copyWith(loading: false));
  }

  Future deleteNew(NewsModel newModel) async {
    newModel.deleting = true;
    emit(state.copyWith(date: DateTime.now().toString()));
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    try{
      var response = await supabaseClient.from('news').delete().eq('id',newModel.id);
      if(response == null){
        news.removeWhere((element) => element.id == newModel.id);
        ShowToastHelper.show(S.current.processSuccess,ToastType.success);
      }else{
        ShowToastHelper.show(S.current.processError,ToastType.error);
      }
    }catch(e){
      ShowToastHelper.show(S.current.processError,ToastType.error);
    }
    newModel.deleting = false;
    emit(state.copyWith(date: DateTime.now().toString()));
  }


}
