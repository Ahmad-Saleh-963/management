import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:management_states/config/constant/icons_app.dart';
import 'package:management_states/services/location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class ScanAll extends StatelessWidget {
  const ScanAll({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  '',
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  MapboxMapController? mapController;
  LatLng? _origin;
  LatLng? _destination;
  String _distance = '';
  List<LatLng> _routeCoordinates = [];
  MyLocation myLocation = MyLocation();

  void getMyLocation()async{

    myLocation.lang = 36.113163;
    myLocation.long = 36.6953565;
    GetMyLocation location = await myLocation.getMyLocation();
    if(location == GetMyLocation.ok){


    }else if(location == GetMyLocation.noPermission){

    }else if(location == GetMyLocation.serverIsNotEnable){

    }
  }
  @override
  void initState() {
    super.initState();
    getMyLocation();
  }

  String style1 = 'mapbox://styles/ahmadsaleh963964/clydiahhj00o001nwggjtai7v';
  String style2 = 'mapbox://styles/ahmadsaleh963964/clydiih2k00ny01pmgjd32had';
  String style3 = 'mapbox://styles/ahmadsaleh963964/clydim7pm00o101qve7oq1krp';
  String style =  'mapbox://styles/ahmadsaleh963964/clydiahhj00o001nwggjtai7v';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapboxMap(
            styleString: style,
            accessToken: 'sk.eyJ1IjoiYWhtYWRzYWxlaDk2Mzk2NCIsImEiOiJjbHlkaHF0aWowNXdvMmlxeWpyNDF6OXByIn0.UiJftNVGFWrC5xK-v1UyGg',
            initialCameraPosition: CameraPosition(
              target: LatLng(myLocation.lang,myLocation.long), // Initial position
              zoom: 18,
            ),
            onMapCreated: _onMapCreated,
            onMapClick: _onMapClick2,
            onStyleLoadedCallback: _onStyleLoaded,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Text(
                'Distance: $_distance',
                style: const TextStyle(fontSize: 8),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _calculateDistance,
              child: const Icon(Icons.calculate),
            ),
          ),
          Positioned(
            top: 35,
            right: 20,
            child: FloatingActionButton(
              onPressed: (){
                if(style == style1){
                  style = style2;
                }else if(style == style2){
                  style = style3;
                } else{
                  style = style1;
                }
                setState(() {});
              },
              child: const Icon(Icons.layers),
            ),
          ),
        ],
      ),
    );
  }


  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    centers.sort((a, b) => (a.latitude + a.longitude).compareTo(b.latitude + b.longitude));
    for(var center in centers){
      _addMarker(
          center,
          true
      );
      centersLoc.add(center.latitude+center.longitude);
    }
    setState(() {});
  }

  Future<void> _calculateDistance() async {
    if(_origin == null)return;

    int index = findIndex(centersLoc, _origin!.latitude+_origin!.longitude);
    if(index>4 && index < centersLoc.length-4 ){
      await getRoute(_origin!,index);
      await getRoute(_origin!,index-1);
      await getRoute(_origin!,index+1);
    }else{
      await getRoute(_origin!,index);
    }


  }
  getRoute(LatLng loc,int index)async{
    const apiKey = 'sk.eyJ1IjoiYWhtYWRzYWxlaDk2Mzk2NCIsImEiOiJjbHlkaHF0aWowNXdvMmlxeWpyNDF6OXByIn0.UiJftNVGFWrC5xK-v1UyGg';
    final url = Uri.parse(
        'https://api.mapbox.com/directions/v5/mapbox/driving/${loc.longitude},${loc.latitude};${centers[index].longitude},${centers[index].latitude}?geometries=geojson&access_token=$apiKey');
    final response = await http.get(url);
    final json = jsonDecode(response.body);

    if (json['code'] == 'Ok') {
      final route = json['routes'][0];
      final distanceMeters = route['distance'];
      _distance += (distanceMeters / 1000).toStringAsFixed(2) + ' km  ---- ';

      final geometry = route['geometry'];
      final coordinates = geometry['coordinates'];
      _routeCoordinates = coordinates.map<LatLng>((coord) => LatLng(coord[1], coord[0])).toList();

      setState(() {});
      _addRouteLine();
    } else {
      showToast('Error fetching route: ${json['code']}');
      // Handle error
      print('Error fetching route: ${json['code']}');
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

  void _onStyleLoaded() {
    // Optional: add any initial markers, lines, etc.

    mapController?.addSymbol(SymbolOptions(
      geometry: LatLng(myLocation.lang,myLocation.long),
      iconImage:ImagesApp.location,
    ));
  }



  Future<bool> _addMarker(LatLng coordinates, bool isCenter) async{
    await mapController?.addSymbol(
      SymbolOptions(
        geometry: coordinates,
        iconImage: isCenter ?   ImagesApp.center : ImagesApp.location,
        iconSize: isCenter ? 0.1 : 1.0,
      ),
    );
    return true;
  }

  int l = 0;
  void _onMapClick2(Point<double> point, LatLng coordinates)async {
    if(l != 0){
      setState(() {});
      return;
    }
    l++;

    double lang = coordinates.latitude;
    double long = coordinates.longitude;
    _origin = coordinates;
    double numi = 0.0005;
    double numj = 0.0005;
  //  for(var i= 0 ; i < 50 ; i++) {
  //   for(var j = 0 ; j <500 ;j++){
    //   long+=numj;
       _addMarker(LatLng(lang, long), false);
    // }
   //  long+=numj;
   // }


  }

  List<LatLng> centers = [
    const LatLng(36.10796454763384, 36.69354206227072),
    const LatLng(36.08801891731433, 36.715136403874),
    const LatLng(36.211977643151556, 36.77065339869611),
    const LatLng(36.181058997730744, 36.718460130073055),
    const LatLng(36.13298182424364, 36.74118428381834),
    const LatLng(36.010432159898926, 36.67086870688408),
    const LatLng(36.05907455807653, 36.697849735107155),
    const LatLng(36.06505000019163, 36.671483270212036),
    const LatLng(36.07412582054819, 36.6357104097859),
    const LatLng(35.86420641162026, 36.80209577546452),
    const LatLng(35.92690620769865, 36.63337362908757),
    const LatLng(36.14001500634264, 36.82226362541829),
    const LatLng(36.11802604236843, 36.800811319170975),
    const LatLng(36.08821695870158, 36.760242771313955),
    const LatLng(36.16351707026739, 36.78408044364588),
    const LatLng(36.22868129527899, 36.81160899630834),
    const LatLng(36.291409405030365, 36.79962526046566),
    const LatLng(36.26900237617477, 36.74727159159204),
    const LatLng(36.08138999614644, 36.8312087438475),
  ];
  List<num> centersLoc = [];

  // الدالة لإضافة عنصر جديد والمحافظة على ترتيب المصفوفة
  int findIndex(List<num> arr, num newItem) {
    int low = 0;
    int high = arr.length - 1;
    int mid = 0;

    // البحث الثنائي لإيجاد الموضع المناسب
    while (low <= high) {
      mid = (low + high) ~/ 2;

      if (arr[mid] == newItem) {
        // إذا تم العثور على العنصر المطلوب
        break;
      } else if (arr[mid] < newItem) {
        // إذا كان العنصر في النصف الأيمن من المصفوفة
        low = mid + 1;
      } else {
        // إذا كان العنصر في النصف الأيسر من المصفوفة
        high = mid - 1;
      }
    }

    // إدراج العنصر الجديد في الموضع المناسب
    if (arr[mid] < newItem) {
      return mid+1;

    } else {
      return mid;
    }
  }



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
