import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/library/utils/toast_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/services/location/location.dart';
import 'package:management_states/services/notfications/ask_permisen_notfications.dart';
import 'package:management_states/utils/toast.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;
import 'package:optimize_battery/optimize_battery.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'map_state.dart';

class MapBloc extends Cubit<MapState> {
  String blackStyle = 'mapbox://styles/ahmadsaleh963964/clydim7pm00o101qve7oq1krp';
  String streetStyle = 'mapbox://styles/ahmadsaleh963964/clydiih2k00ny01pmgjd32had';
  String terrainStyle = 'mapbox://styles/ahmadsaleh963964/clydiahhj00o001nwggjtai7v';
  MapboxMapController? mapController;
  List<LatLng> _routeCoordinates = [];
  MyLocation myLocation = MyLocation();
  late CameraPosition cameraPosition;
  late UserModel user;

  MapBloc() : super(MapState.initial()) {
    cameraPosition =  CameraPosition(
      target: const LatLng(36.113163,36.6953565),
      zoom: state.zoomCamera,
    );
    user = SharedPreferencesHelper.getUser()!;
    emit(state.copyWith(date: DateTime.now().toString()));
  }

  void getMyLocation()async{
    emit(state.copyWith(loadMyLocation: true));
    myLocation.lang = 36.113163;
    myLocation.long = 36.6953565;
    GetMyLocation location = await myLocation.getMyLocation();
    if(location == GetMyLocation.ok){
    }else if(location == GetMyLocation.noPermission){
    }else if(location == GetMyLocation.serverIsNotEnable){
    }
    emit(state.copyWith(loadMyLocation: true));
  }

  void onMapCreated(MapboxMapController controller) {
    mapController = controller;
    centers.sort((a, b) => (a.latitude + a.longitude).compareTo(b.latitude + b.longitude));
    for(var center in centers){
      _addMarker(center);
      centersLoc.add(center.latitude+center.longitude);
    }
  }



 Future<void> getRoute(LatLng loc,LatLng loc2)async{
    emit(state.copyWith(loadingDistance: true));
    const apiKey = SharedPreferencesHelper.MAPBOX_ACCESS_TOKEN;
    try{
      final url = Uri.parse(
          'https://api.mapbox.com/directions/v5/mapbox/driving/${loc.longitude},${loc.latitude};${loc2.longitude},${loc2.latitude}?geometries=geojson&access_token=$apiKey');
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      if (json['code'] == 'Ok') {
        final route = json['routes'][0];
        final distanceMeters = route['distance'];
        String dis = '${state.distance + (distanceMeters / 1000).toStringAsFixed(2)} km  ,  ';
        emit(state.copyWith(distance:dis));


        final geometry = route['geometry'];
        final coordinates = geometry['coordinates'];
        _routeCoordinates = coordinates.map<LatLng>((coord) => LatLng(coord[1], coord[0])).toList();

        _addRouteLine();
        emit(state.copyWith(loadingDistance: true));
      } else {
        ShowToastHelper.show('فشل التحميل  ${json['code']} ',ToastType.error);
      }
    }catch(e){
      ShowToastHelper.show('فشل التحميل  ${e} ',ToastType.error);
    }

  }

  void _addRouteLine() {
    if (_routeCoordinates.isNotEmpty) {
      String colorRandom = getRandomBlueColorAsString();
      mapController?.addLine(LineOptions(
        geometry: _routeCoordinates,
        lineColor: "#$colorRandom",
        lineWidth: 5.0,
      ));
    }
  }

  void onStyleLoaded() {
    // Optional: add any initial markers, lines, etc.

    mapController?.addSymbol(SymbolOptions(
      geometry: LatLng(myLocation.lang,myLocation.long),
      iconImage:ImagesApp.location,
    ));
  }

  Future<bool> _addMarker(LatLng coordinates) async{
    emit(state.copyWith());
    await mapController?.addSymbol(
      SymbolOptions(
        geometry: coordinates,
        iconImage: state.option == Options.addCenter ? ImagesApp.center : state.option == Options.calcDistance ? ImagesApp.fire : ImagesApp.location,
        iconSize: state.option == Options.addCenter ? 0.2 : state.option == Options.calcDistance ? 1.5 : 1.0,
      ),
    );
    emit(state.copyWith(date: DateTime.now().toString()));
    return true;
  }


  List<LatLng> centers = [
    // const LatLng(36.10796454763384, 36.69354206227072),
    // const LatLng(36.08801891731433, 36.715136403874),
    // const LatLng(36.211977643151556, 36.77065339869611),
    // const LatLng(36.181058997730744, 36.718460130073055),
    // const LatLng(36.13298182424364, 36.74118428381834),
    // const LatLng(36.010432159898926, 36.67086870688408),
    // const LatLng(36.05907455807653, 36.697849735107155),
    // const LatLng(36.06505000019163, 36.671483270212036),
    // const LatLng(36.07412582054819, 36.6357104097859),
    // const LatLng(35.86420641162026, 36.80209577546452),
    // const LatLng(35.92690620769865, 36.63337362908757),
    // const LatLng(36.14001500634264, 36.82226362541829),
    // const LatLng(36.11802604236843, 36.800811319170975),
    // const LatLng(36.08821695870158, 36.760242771313955),
    // const LatLng(36.16351707026739, 36.78408044364588),
    // const LatLng(36.22868129527899, 36.81160899630834),
    // const LatLng(36.291409405030365, 36.79962526046566),
    // const LatLng(36.26900237617477, 36.74727159159204),
    // const LatLng(36.08138999614644, 36.8312087438475),
  ];
  List<num> centersLoc = [];

  String getRandomBlueColorAsString() {
    final random = Random();
    // Generate random values between 0 and 255 for red and green channels
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = 255; // Always full blue

    // Convert the values to a hexadecimal string
    String redHex = red.toRadixString(16).padLeft(2, '0').toUpperCase();
    String greenHex = green.toRadixString(16).padLeft(2, '0').toUpperCase();
    String blueHex = blue.toRadixString(16).padLeft(2, '0').toUpperCase();

    return '$redHex$greenHex$blueHex';
  }


  ///==================
  void onMapClick2(Point<double> point, LatLng coordinates)async {
    double lang = coordinates.latitude;
    double long = coordinates.longitude;

    if(user.roleUser == RoleUser.user){
      emit(state.copyWith(option: Options.calcDistance));
    }

    if(state.option == Options.addLocation){
      _addMarker(LatLng(lang,long));
    }else if(state.option == Options.addCenter){
      _addMarker(LatLng(lang,long));
      centers.add(coordinates);
      centersLoc.add(coordinates.latitude+coordinates.longitude);
    }else if(state.option == Options.calcDistance){
      emit(state.copyWith(option: Options.calcDistance));
      addLocationDb(LatLng(lang,long));
      await _addMarker(coordinates);
      getNearCenter(coordinates);
    }
    emit(state.copyWith(date: DateTime.now().toString()));
  }

   void setStyleMap(int style){
    if(style == 1){
      emit(state.copyWith(styleMap: blackStyle));
    }else if (style == 2){
      emit(state.copyWith(styleMap: streetStyle));
    }else{
      emit(state.copyWith(styleMap: terrainStyle));
    }
  }

   void increaseZoom(){
    double zoom = state.zoomCamera + 1;
    cameraPosition =  CameraPosition(
      target: LatLng(myLocation.lang , myLocation.long),
      zoom: zoom,
    );
    emit(state.copyWith(zoomCamera: zoom));
   }

   void decreaseZoom(){
     double zoom = state.zoomCamera - 1;
     cameraPosition =  CameraPosition(
       target: LatLng(myLocation.lang , myLocation.long),
       zoom: zoom,
     );
     emit(state.copyWith(zoomCamera: zoom));
   }

   void addOption(Options option){
    emit(state.copyWith(option: option));
  }

   void calculateDistance(LatLng coordinates) async {

    if(centers.isEmpty)return;
    emit(state.copyWith(loadingDistance:true));
    // int index = findClosestIndex(centersLoc, coordinates.latitude+coordinates.longitude);
    await getRoute(coordinates,coordinates);
    emit(state.copyWith(loadingDistance:false));
  }




  getNearCenter(LatLng coordinates)async{
     if(centers.isEmpty)return;
     double minDistance = double.infinity;
     LatLng? closestCenter;
     for (var center in centers) {
       double distance = haversine(
         coordinates.latitude,
         coordinates.longitude,
         center.latitude,
         center.longitude,
       );
       if (distance < minDistance) {
         minDistance = distance;
         closestCenter = center;
       }
     }
     emit(state.copyWith(loadingDistance:true));
     await getRoute(closestCenter!,coordinates);
     calculateDistance(closestCenter);
     emit(state.copyWith(loadingDistance:false));
     return closestCenter;
   }

  double haversine(double lat1, double lon1, double lat2, double lon2) {
    const R = 6371; // نصف قطر الأرض بالكيلومتر
    var dLat = _degToRad(lat2 - lat1);
    var dLon = _degToRad(lon2 - lon1);
    var a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_degToRad(lat1)) * cos(_degToRad(lat2)) *
            sin(dLon / 2) * sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  double _degToRad(double deg) {
    return deg * (pi / 180);
  }



  addLocationDb(LatLng latLng)async{
    SupabaseClient supabaseClient = SharedPreferencesHelper.getInstanceSupabase();
    UserModel? user = SharedPreferencesHelper.getUser();
    try{
      var response = await supabaseClient.from('states').insert({
        "fkUser":user!.id,
        "name":user.name,
        "email":user.email,
        "phone":user.phone,
        "matherName":'-',
        "fatherName":'-',
        "isBand":false,
        "type":"normal",
        "stateType":"حريق",
        "lang":"${latLng.latitude}",
        "long":"${latLng.longitude}",
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

}
