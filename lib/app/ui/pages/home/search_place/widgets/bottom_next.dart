import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_meedu/router.dart' as router;
import '../search_place_page.dart'
    show OriginAndDestinationResponse, searchProvider;

class BottomNext extends StatelessWidget {
  const BottomNext({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, __) {
        final controller = ref.watch(searchProvider);
        final origin = controller.origin;
        final destination = controller.destination;
        final bool enabled = origin != null && destination != null;
        return Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, bottom: 20),
            child: FloatingActionButton(
              onPressed: enabled
                  ? () {
                      router.pop(
                        OriginAndDestinationResponse(origin, destination),
                      );
                    }
                  : null,
              elevation: 0,
              backgroundColor:
                  enabled ? const Color(0xFF1ed760) : const Color(0xFFe8ece4),
              child: enabled
                  ? const Icon(CupertinoIcons.arrow_right)
                  : const Icon(
                      CupertinoIcons.arrow_right,
                      color: Colors.grey,
                    ),
            ),
          ),
        );
      },
    );
  }
}
