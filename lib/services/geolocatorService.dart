/*
This class allows us to use the Google GeoLocator API to get the user's current
location. Potentially we can use this to find the nearest store to the user to 
add as a product attribute.
*/

import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
