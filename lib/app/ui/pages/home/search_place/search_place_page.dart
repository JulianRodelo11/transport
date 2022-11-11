import 'package:app_transport/app/data/providers/remote/search_api.dart';
import 'package:app_transport/app/data/providers/repositories_impl/search_repository_impl.dart';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_app_bar.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_imputs.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_results.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../domain/models/place.dart';

abstract class SearchResponse {}

class PickFromMapResponse extends SearchResponse {
  final bool isOrigin;

  PickFromMapResponse(this.isOrigin);
}

class OriginAndDestinationResponse extends SearchResponse {
  final Place origin, destination;
  OriginAndDestinationResponse(this.origin, this.destination);
}

class SearchPlacePage extends StatelessWidget {
  final Place? initialOrigin, initialDestination;
  final bool hasOriginFocus;
  const SearchPlacePage({
    Key? key,
    this.initialOrigin,
    this.initialDestination,
    required this.hasOriginFocus,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPlaceController(
        SearchRepositoryImpl(
          SearchApi(Dio()),
        ),
        origin: initialOrigin,
        destination: initialDestination,
        hasOriginFocus: hasOriginFocus,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SafeArea(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 55,
                      width: double.infinity,
                      color: Colors.white,
                      child: const SearchAppBar(),
                    ),
                  ],
                ),
                const SearchImputs(),
                const Expanded(
                  child: SearchResults(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
