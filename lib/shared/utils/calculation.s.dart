import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class Calculation {
  static String formatTimeNow(DateTime dateTime) {
    String formattedTime = DateFormat.Hm().format(dateTime); // Format HH:mm
    return formattedTime;
  }

  static String formatDefaultDateTime(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('dd MMM yyyy HH:mm');
    return dateFormat.format(dateTime);
  }

  static double calculateDistance(LatLng start, LatLng end) {
    const double radiusEarth = 6371.0; // in kilometers

    // Convert degrees to radians
    double startLatRadians = _degreesToRadians(start.latitude);
    double endLatRadians = _degreesToRadians(end.latitude);
    double deltaLonRadians = _degreesToRadians(end.longitude - start.longitude);

    // Haversine formula
    double a = pow(sin((endLatRadians - startLatRadians) / 2), 2) +
        cos(startLatRadians) *
            cos(endLatRadians) *
            pow(sin(deltaLonRadians / 2), 2);
    double c = 2 * asin(sqrt(a));

    // Calculate the distance
    double distance = radiusEarth * c;
    return distance;
  }

  static double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
}
