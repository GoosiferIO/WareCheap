/*
This class allows us to use the Google Places API to get find the nearest store
to the user's current location and display it as a product attribute.
*/

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:warecheap/widgets/wcPlacesSearch.dart';

class PlacesService {
  Future<List<wcPlacesSearch>> populateAutoComplete(String search) async {
    // query the Google Places API for the grocery stores near the user's
    // current location
    String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&location=39.728147832282176%2C-121.83885953237088&radius=500&types=supermarket&key=AIzaSyBYaeTxu-6OQTnD1jyhB1OA2R28oMgTVzk';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => wcPlacesSearch.fromJson(place)).toList();
  }

  searchGroceries(String search) async {
    // query the Google Places API for the grocery stores near the user's
    // current location
    String url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$search&location=39.728147832282176%2C-121.83885953237088&radius=500&types=supermarket&key=AIzaSyBYaeTxu-6OQTnD1jyhB1OA2R28oMgTVzk';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => wcPlacesSearch.fromJson(place)).toList();
  }
}
