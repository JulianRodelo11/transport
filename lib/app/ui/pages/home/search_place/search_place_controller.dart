import 'dart:async';

import 'package:app_transport/app/domain/models/place.dart';
import 'package:app_transport/app/domain/repositories/search_repository.dart';
import 'package:app_transport/app/helpers/current_position.dart';
import 'package:flutter/widgets.dart'
    show ChangeNotifier, FocusNode, TextEditingController;

class SearchPlaceController extends ChangeNotifier {
  final SearchRepository _searchRepository;
  String _query = '';
  String get query => _query;

  late StreamSubscription _subscription;

  List<Place>? _places = [];
  List<Place>? get places => _places;

  Place? _origin, _destination;
  Place? get origin => _origin;
  Place? get destination => _destination;

  final originfocusNode = FocusNode();
  final destinationfocusNode = FocusNode();

  final originController = TextEditingController();
  final destinationController = TextEditingController();

  bool _originHasFocus = true;

  SearchPlaceController(this._searchRepository) {
    _subscription = _searchRepository.onResults.listen(
      (results) {
        _places = results;
        notifyListeners();
      },
    );

    originfocusNode.addListener(() {
      if (originfocusNode.hasFocus && !_originHasFocus) {
        _onoriginFocusNodeChanged(true);
      } else if (!originfocusNode.hasFocus && _origin == null) {
        originController.text = '';
      }
    });
    destinationfocusNode.addListener(() {
      if (destinationfocusNode.hasFocus && _originHasFocus) {
        _onoriginFocusNodeChanged(false);
      } else if (!destinationfocusNode.hasFocus && _destination == null) {
        destinationController.text = '';
      }
    });
  }

  Timer? _debouncer;

  void _onoriginFocusNodeChanged(bool hasFocus) {
    _originHasFocus = hasFocus;
    _places = [];
    _query = '';
    notifyListeners();
  }

  void onQueryChange(String text) {
    _query = text;
    _debouncer?.cancel();
    _debouncer = Timer(
      const Duration(milliseconds: 200),
      () {
        if (_query.length >= 3) {
          final currentPosition = CurrentPosition.i.value;
          if (currentPosition != null) {
            _searchRepository.cancel();
            _searchRepository.search(query, currentPosition);
          }
        } else {
          clearQuery();
        }
      },
    );
  }

  void clearQuery() {
    _searchRepository.cancel();
    _places = [];
    if (_originHasFocus) {
      _origin = null;
    } else {
      _destination = null;
    }
    notifyListeners();
  }

  void pickPlace(Place place) {
    if (_originHasFocus) {
      _origin = place;
      originController.text = place.title;
    } else {
      _destination = place;
      destinationController.text = place.title;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    originController.dispose();
    destinationController.dispose();
    originfocusNode.dispose();
    destinationfocusNode.dispose();
    _debouncer?.cancel();
    _subscription.cancel();
    _searchRepository.dispose();
    super.dispose();
  }
}
