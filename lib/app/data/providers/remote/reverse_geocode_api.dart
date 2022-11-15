import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

import '../../../domain/models/place.dart';

class ReverseGeocodeAPI {
  final Dio _dio;

  ReverseGeocodeAPI(this._dio);
  CancelToken? _cancelToken;

  Future<Place?> parse(LatLng at) async {
    cancel();
    try {
      _cancelToken = CancelToken();
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/geocode/json',
        queryParameters: {
          'latlng': '${at.latitude},${at.longitude}',
          'key': 'AIzaSyBs2j-jjHUDcD7eVZnXFDthIKLOfyoFij4',
        },
        cancelToken: _cancelToken,
      );

      _cancelToken = null;

      final list = response.data['results'] as List;
      if (list.isEmpty) {
        return null;
      }

      final element = list.first;

      return Place(
        houseNumber: '',
        resultType: '',
        id: '',
        title: element['formatted_address'],
        address: '',
        position: at,
        distance: 2,
      );
    } catch (e) {
      _cancelToken = null;
      return null;
    }
  }

  void cancel() {
    _cancelToken?.cancel();
    _cancelToken = null;
  }
}
