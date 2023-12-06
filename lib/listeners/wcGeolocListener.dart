/*
This class lets us listen for the user's current location. If it is updated,
we can use setCurrentLocation() to update the user's current location in the
UI. Primarily, we want to use this in the 'Browse' page to find the nearest
store to the user and display it as a product attribute.
*/

import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:warecheap/services/geolocatorService.dart';

class geoLocatorListener with ChangeNotifier {
  // properities
  Position? currentPosition;

  // immediately get the user's current location without waiting for the
  // setCurrentLocation() method to be called
  geoLocatorListener() {
    currentLocation();
  }

  currentLocation() async {
    currentPosition = await GeolocatorService().getCurrentLocation();
    notifyListeners();
  }
}
