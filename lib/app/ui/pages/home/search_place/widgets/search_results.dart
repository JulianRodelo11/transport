import 'package:app_transport/app/ui/pages/home/search_place/page_view_search.dart';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(searchProvider);
    final places = controller.places;
    final origin = controller.origin;
    final destination = controller.destination;
    final bool enabled = origin != null && destination != null;
    if (places == null) {
      return const Center(
        child: Text("Error"),
      );
    } else if (places.isEmpty) {
      return const PageViewSearch();
    } else if (enabled) {
      return Container();
    }
    return ListView.builder(
      itemBuilder: (_, index) {
        final place = places[index];
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListTile(
            title: Text(
              place.title,
            ),
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.pickPlace(place);
            },
          ),
        );
      },
      itemCount: places.length,
    );
  }
}
