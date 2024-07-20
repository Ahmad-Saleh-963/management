import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/data_structure/init_exam/init_exam_model.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'math_state.dart';

class MathBloc extends Cubit<MathState> {
  late UserModel user;
  late SupabaseClient supabaseClient;


  MathBloc() : super(MathState.initial()) {
    supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    user = SharedPreferencesHelper.getUser()!;
    emit(state.copyWith(date: DateTime.now().toString()));
  }

}