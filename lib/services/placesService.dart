/*
This class allows us to use the Google Places API to get find the nearest store
to the user's current location and display it as a product attribute.
*/

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:warecheap/widgets/wcPlacesSearch.dart';

class PlacesService {
  Future<List<wcPlacesSearch>> populateAutoComplete(String search) async {}
}
