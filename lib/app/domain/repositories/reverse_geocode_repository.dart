import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../models/place.dart';

abstract class ReverseGeocodeRepository {
  Future<Place?> parse(LatLng at);
  void cancel();
}
