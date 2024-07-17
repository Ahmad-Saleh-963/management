import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/data_structure/news/news.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';

import 'add_news_state.dart';

class AddNewsBloc extends Cubit<AddNewsState> {

  TextEditingController title  = TextEditingController();
  TextEditingController description  = TextEditingController();
  late NewsModel news;

  AddNewsBloc() : super(AddNewsState.initial()) {
    final user = SharedPreferencesHelper.getUser();
    news = NewsModel(
        id: user!.id,
        fkUser: user.id,
        urlImage:'',
        title: '',
        description: '',
        nameUser: user.name,
        nameImage: ''
    );
  }

  void onChangeDescription(){
    news.description = description.text ?? '';
    emit(state.copyWith(date: DateTime.now().toString()));
  }

}
