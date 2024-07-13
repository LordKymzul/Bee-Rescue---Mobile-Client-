import 'package:beerescue_mobile/features/model/autocomplete-prediction.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import '../../model/place-autocomplete-response.dart';

abstract class LocationService {
  Future<Position> currentLocation();
  Future<List<AutoCompletePrediction>> placePredictions(String query);
}

class LocationServiceImpl implements LocationService {
  @override
  Future<Position> currentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }
    Position currentLocation = await Geolocator.getCurrentPosition();

    print(
        'Latitude: ${currentLocation.latitude} Longitude: ${currentLocation.longitude} ');
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<List<AutoCompletePrediction>> placePredictions(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {"input": query, "key": 'AIzaSyCYaqpwYBzj60jK6ygFCmQtx_yD8KzMr5U'});

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      if (response != null) {
        PlaceAutoCompleteResponse placeAutoCompleteResponse =
            PlaceAutoCompleteResponse.parseAutoCompleteResult(response.body);

        if (placeAutoCompleteResponse.predictions != null) {
          print(response.body);
          return placeAutoCompleteResponse.predictions!;
        }
      }
    }
    return [];
  }
}
