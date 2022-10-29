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

class SearchResponse {
  final Place origin, destination;
  SearchResponse(this.origin, this.destination);
}

class SearchPlacePage extends StatelessWidget {
  const SearchPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SearchPlaceController(
        SearchRepositoryImpl(
          SearchApi(Dio()),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const SearchAppBar(),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: const [
                SearchImputs(),
                Expanded(
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
