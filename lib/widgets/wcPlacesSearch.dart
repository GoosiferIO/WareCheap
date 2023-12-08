/*
The wcPlacesSearch library defines the custom widget used to display the places
search bar in the 'Browse' page of the app. It also defines the custom widget
used to display the search results in the dropdown menu.
*/

class wcPlacesSearch {
  final String description;
  final String placeId;

  wcPlacesSearch({required this.description, required this.placeId});

  factory wcPlacesSearch.fromJson(Map<String, dynamic> json) {
    return wcPlacesSearch(
      description: json['description'] as String? ?? '',
      placeId: json['place_id'] as String? ?? '',
    );
  }
}
