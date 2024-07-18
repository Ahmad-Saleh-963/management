import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/library/blocs/map_bloc/map_bloc.dart';
import 'package:management_states/library/blocs/map_bloc/map_state.dart';
import 'package:management_states/library/constant/colors_app.dart';
import 'package:management_states/library/data_structure/user/user.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';
import 'package:management_states/utils/ui/my_drawer.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late MapBloc bloc;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  void getMsg()async{

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message in foreground: ${message.notification?.title}");
      // يمكنك هنا إضافة الإجراءات التي تريد تنفيذها عند استلام الرسالة في التطبيق مفتوح
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("App opened from background: ${message.notification?.title}");
      // يمكنك هنا إضافة الإجراءات التي تريد تنفيذها عندما يتم فتح التطبيق من الخلفية
    });

  }



  @override
  void initState() {
    super.initState();
    bloc = MapBloc();
    bloc.getMyLocation();
    bloc.testPiremistions(context);
    getMsg();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocBuilder<MapBloc, MapState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            key: _scaffoldKey,
            endDrawer: MyDrawer(
              width: width,
              height: height,
            ),
            body: Stack(
              children: [
                MapboxMap(
                  accessToken: SharedPreferencesHelper.MAPBOX_ACCESS_TOKEN,
                  styleString: state.styleMap,
                  initialCameraPosition: bloc.cameraPosition,
                  onMapCreated: bloc.onMapCreated,
                  onMapClick: bloc.onMapClick2,
                  onStyleLoadedCallback: bloc.onStyleLoaded,
                ),
                Positioned(top: 50, left: 20, child: _buildLayerMap(context)),
                Positioned(
                  bottom: 80,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.white,
                    child: Text(
                      'Distance: ${state.distance}',
                      style: const TextStyle(fontSize: 5),
                    ),
                  ),
                ),
                Positioned(
                    top: 50,
                    right: 25,
                    child:GestureDetector(
                      onTap: (){
                        if(!_scaffoldKey.currentState!.isDrawerOpen){
                          _scaffoldKey.currentState!.openEndDrawer();
                        }
                      },
                      child: SvgPicture.asset(
                        ImagesApp.drawer,
                        color:ColorsApp.primaryColor,
                      ),
                    )),
              ],
            ),
            floatingActionButton: bloc.user.roleUser == RoleUser.admin ? _buildFloatActionWidget(context,state)
                :
                null,
          );
        });
  }

  Widget _buildFloatActionWidget(BuildContext context , MapState state) {
    return SpeedDial(
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 10,
      label: state.loadingDistance ? const CircularProgressIndicator() : const Text("الخيارات"),
      activeLabel: const Text("إغلاق"),
      onOpen: () => debugPrint('OPENING DIAL'),
      onClose: () => debugPrint('DIAL CLOSED'),
      useRotationAnimation: true,
      tooltip: 'Open Speed Dial',
      heroTag: 'speed-dial-hero-tag',
      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      shape: false ? const RoundedRectangleBorder() : const StadiumBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: const Icon(Icons.add_business_outlined),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          label:  'حساب المسافة',
          visible: true,
          onTap: () =>  bloc.addOption(Options.calcDistance),
        ),
        SpeedDialChild(
          child: const Icon(Icons.location_on_outlined),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          label: 'إضافة موقع',
          onTap: () =>  bloc.addOption(Options.addLocation),
        ),
        SpeedDialChild(
          child: const Icon(Icons.add_business_outlined),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          label: S.current.addCenter,
          visible: true,
          onTap: () =>  bloc.addOption(Options.addCenter),
        ),
      ],
    );
  }

  Widget _buildLayerMap(BuildContext context) {
    return SpeedDial(
      icon: Icons.layers,
      activeIcon: Icons.close,
      spacing: 2,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 10,
      useRotationAnimation: true,
      tooltip: S.current.styleMap,
      overlayOpacity: 0,
      elevation: 0,
      animationCurve: Curves.elasticInOut,
      shape: const StadiumBorder(),
      direction: SpeedDialDirection.down,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.landslide_sharp),
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          onTap: () => bloc.setStyleMap(1),
          onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: const Icon(Icons.route_sharp),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          onTap: () => bloc.setStyleMap(2),
        ),
        SpeedDialChild(
          child: const Icon(Icons.landscape_sharp),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          visible: true,
          onTap: () => bloc.setStyleMap(3),
          onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
        ),
      ],
    );
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

}
