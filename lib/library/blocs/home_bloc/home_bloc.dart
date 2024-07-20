import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/services/notfications/ask_permisen_notfications.dart';
import 'package:management_states/utils/toast.dart';
import 'package:optimize_battery/optimize_battery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'home_state.dart';

class HomeBloc extends Cubit<MapState> {
  late UserModel user;
  late SupabaseClient supabaseClient;

  HomeBloc() : super(MapState.initial()) {
    supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    user = SharedPreferencesHelper.getUser()!;
    emit(state.copyWith(date: DateTime.now().toString()));
  }

  addLocationDb()async{
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    UserModel? user = SharedPreferencesHelper.getUser();
    try{
      var response = await supabaseClient.from('states').insert({
        "fkUser":user!.id,
        "name":user.name,
        "email":user.email,
        "matherName":'-',
        "fatherName":'-',
        "isBand":false,
        "type":"normal",
        "fkCenter":user.id,
        "stateType":"حريق",
      });
      if(response == null){
        ShowToastHelper.show(S.current.processSuccess, ToastType.success);
      }else{
        ShowToastHelper.show(S.current.processError, ToastType.error);
      }
    }catch(e){
      print(e);
      ShowToastHelper.show(S.current.processError, ToastType.error);
    }
  }

  void testPiremistions(BuildContext context){
    NotficationsService  notficationsService = NotficationsService();
    notficationsService.requsetNotficaionPermisen();
    OptimizeBattery.isIgnoringBatteryOptimizations().then((onValue) {
      if (onValue) {} else {
        showDialogForInfo("يرجى إعطاء صلاحيات عمل التطبيق بالخلفية\n لضمان وصول التنبيهات والإشعارات \n\n (وضع لاتوجد قيود على استخدام التطبيق للبطارية) ","صلاحيات العمل",context);
      }
    });

  }

  showDialogForInfo(String msg,String title,context){
    showDialog(
      barrierDismissible: false,
      context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        elevation: 10,
        scrollable: false,
        title: Text(title,textAlign: TextAlign.center,style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18)),
        content:  Text(msg,textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: const TextStyle(fontSize: 15)),
        actions: [
          Center(child: MaterialButton(
            color:Colors.white,
            child: const Text("حسنا", style: TextStyle(fontSize: 14)),
            onPressed: () {Navigator.pop(context); OptimizeBattery.stopOptimizingBatteryUsage();},
          ),)
        ],
      );},);
  }

  void getCenters()async{
    try {
      var response = await supabaseClient.from('users').select().eq("type","adminCenter");
      if (response.isNotEmpty) {
      }
    } catch (e) {
      ShowToastHelper.show(S.current.noConnection, ToastType.error);
    }
  }

}