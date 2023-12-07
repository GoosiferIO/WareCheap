/*
This class allows us to use the Google GeoLocator API to get the user's current
location. Its use is primarily to update the Maps API to the current location of
the user, but we can also use it to find the nearest store to the user in tandem
with the Google Places API.
*/

import 'package:geolocator/geolocator.dart';

class GeolocatorService {
  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}
