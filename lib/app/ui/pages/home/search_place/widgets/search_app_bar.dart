import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Builder(
              builder: (context) {
                final controller = context.watch<SearchPlaceController>();
                final origin = controller.origin;
                final destination = controller.destination;
                final bool enabled = origin != null && destination != null;

                return CupertinoButton(
                  child: const Text("Listo"),
                  onPressed: enabled
                      ? () {
                          Navigator.pop(
                            context,
                            OriginAndDestinationResponse(origin, destination),
                          );
                        }
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(55);
}
