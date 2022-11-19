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
          padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              controller.pickPlace(place);
            },
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 55,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFFeeeeee),
                        radius: 15,
                        child: Icon(
                          Icons.location_pin,
                          size: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10.0,
                          ),
                          child: Text(
                            place.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 10.0),
                  child: Container(
                    height: 3,
                    width: double.infinity,
                    color: const Color(0xFFF8F8F8),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: places.length,
    );
  }
}
