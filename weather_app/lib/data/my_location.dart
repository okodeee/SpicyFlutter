import 'package:geolocator/geolocator.dart';

class MyLocatoin{
  double? latitude2;
  double? longitude2;

  Future<void> getMyCurrentLocation() async{
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.
      getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
    }catch(e) {
      print('There was a problem with the internet connection.');
    }
  }
}