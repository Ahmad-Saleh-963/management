import 'package:geolocator/geolocator.dart';

class MyLocation{
  late double lang = 0.0;
  late double long = 0.0;
  late Position position ;

  Future getMyLocation()async{
    bool services = await Geolocator.isLocationServiceEnabled();
    try{
      if(!services){
        position = await Geolocator.getCurrentPosition();
        bool services = await Geolocator.isLocationServiceEnabled();
        if(!services){return GetMyLocation.serverIsNotEnable;}
        LocationPermission per = await Geolocator.checkPermission();
        if(per == LocationPermission.denied){
          per = await Geolocator.requestPermission();
          if(per != LocationPermission.denied){
            position = await Geolocator.getCurrentPosition();
            lang = position.latitude;
            long = position.longitude;
            return GetMyLocation.ok;
          }
        } else{
          position = await Geolocator.getCurrentPosition();
          lang = position.latitude;
          long = position.longitude;
          return GetMyLocation.ok;
        }
      }
      else{
        LocationPermission per = await Geolocator.checkPermission();
        if(per == LocationPermission.denied){
          per = await Geolocator.requestPermission();
          if(per != LocationPermission.denied){
            position = await Geolocator.getCurrentPosition();
            lang = position.latitude;
            long = position.longitude;
            return GetMyLocation.ok;
          }
        } else{
          position = await Geolocator.getCurrentPosition();
          lang = position.latitude;
          long = position.longitude;
          return GetMyLocation.ok;
        }
        return GetMyLocation.noPermission;
      }
    }catch(e){
      return GetMyLocation.noPermission;
    }
  }

}

enum GetMyLocation{
  serverIsNotEnable,
  ok,
  noPermission,
}