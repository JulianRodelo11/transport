import 'package:app_transport/app/data/providers/remote/search_api.dart';
import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/domain/repositories/search_repository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class SearchRepositoryImpl implements SearchRepository {
  final SearchApi _searchApi;

  SearchRepositoryImpl(this._searchApi);

  @override
  void search(String query, LatLng at) {
    _searchApi.search(query, at);
  }

  @override
  void cancel() {
    _searchApi.cancel();
  }

  @override
  void dispose() {
    _searchApi.dispose();
  }

  @override
  Stream<List<Place>?> get onResults => _searchApi.onResults;
}
