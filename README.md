# warecheap

WareCheap is a Flutter project that helps you find the cheapest grocery prices in your local community.

## Technologies

- Flutter
- Dart
- Google API (Places, Geolocation, Maps)
- BunnyCDN (for image storage)

## Packages Used (Summary)

- geolocator v10.1.0
  - To find user coordinates in the Google Maps widget
- image_picker v1.0.4
  - For camera access and image file saving
- google_maps_flutter v10.6.0
  - For the Google Maps widget
- shared_preferences v2.2.2
  - To access local storage
- path v1.8.3 and path_provder v2.1.1
  - To access file locations
- intl v0.19.0
  - For date formatting
- provider v6.0.5
  - To manage state across pages or sprawling widget trees
- http v0.13.4
  - To sent API requests to BunnyCDN
- google_sign_in v6.1.5
  - For Google auth
- flutter_dotenv v5.1.0
  - To replace API keys with environment variables

### Linter
To use the Linter do the commands:
- "Flutter pub get"
- "dart analyze"

## Project Authors

- Eric Galvan
- Alex Rosete
- Nathan Mortell

## Special Thanks and Sources

- Google Maps autocomplete was possible thanks to this Youtube course by Andy Julow: https://youtu.be/sL74UNLssV8?si=RPfp3ldDKcvYf6Gw
- [BunnyCDN documentation](https://docs.bunny.net/reference/storage-api) was helpful for integrating their API into our app.