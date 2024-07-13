import 'package:beerescue_mobile/features/controller/services/location-services.dart';
import 'package:beerescue_mobile/features/model/autocomplete-prediction.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  LocationService locationService = LocationServiceImpl();

  List<AutoCompletePrediction> _placePredictions = [];
  List<AutoCompletePrediction> get placePredictions => _placePredictions;

  AutoCompletePrediction? _selectedPlace;
  AutoCompletePrediction? get selectedPlace => _selectedPlace;

  Position? _currentLocation;
  Position? get currentLocation => _currentLocation;

  Future<void> handleCurrentLocation() async {
    try {
      Position result = await locationService.currentLocation();
      _currentLocation = result;
    } catch (e) {
      debugPrint('Error fetching current location: $e');
      _currentLocation = null;
    }
    notifyListeners();
  }

  Future<void> placeAutoComplete(String query) async {
    final response = await locationService.placePredictions(query);
    if (response == []) {
      _placePredictions = [];
      notifyListeners();
    }
    _placePredictions = response;
    notifyListeners();
  }

  void handleSelectedPlace(AutoCompletePrediction currentPlace) {
    _selectedPlace = currentPlace;
    _placePredictions.clear();
    notifyListeners();
  }
}
