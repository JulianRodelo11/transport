import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      //systemOverlayStyle: ,
      backgroundColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Builder(
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
                          SearchResponse(origin, destination),
                        );
                      }
                    : null,
              );
            },
          ),
        ),
      ],
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(55);
}
