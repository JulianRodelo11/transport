import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../page_view_search.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<SearchPlaceController>();
    final places = controller.places;
    if (places == null) {
      return const Center(
        child: Text("Error"),
      );
    } else if (places.isEmpty) {
      return const PageViewSearch();
    }
    return ListView.builder(
      itemBuilder: (_, index) {
        final place = places[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListTile(
            /*leading: Text(
                                distanceFormat(place.distance),
                              ),*/
            title: Text(
              place.title,
              //style: TextStyle(fontSize: 1),
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.pickPlace(place);
            },
            //subtitle: Text(place.address),
          ),
        );
      },
      itemCount: places.length,
    );
  }
}
