import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final dynamic id, title, address, houseNumber, resultType;
  final LatLng position;
  final int distance;

  Place(
      {required this.id,
      required this.title,
      required this.address,
      required this.houseNumber,
      required this.resultType,
      required this.position,
      required this.distance});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      title: json['title'],
      resultType: json['resultType'],
      address: json['address']['street'],
      houseNumber: json['address']['houseNumber'],
      position: LatLng(
        json['position']['lat'],
        json['position']['lng'],
      ),
      distance: json['distance'],
    );
  }
}
