import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/utils/go_to_seacrh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhereAreYouGoingButton extends StatelessWidget {
  const WhereAreYouGoingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hide = context.select<HomeController, bool>((controller) {
      final state = controller.state;
      final originAndDestinationReady =
          state.origin != null && state.destination != null;
      return originAndDestinationReady ||
          state.fetching ||
          state.pickFromMap != null;
    });

    if (hide) {
      return Container();
    }
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 30.0,
              left: 20.0,
              right: 20.0,
            ),
            child: GestureDetector(
              onTap: () => goToSearch(context),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(
                      CupertinoIcons.location_fill,
                      color: Colors.black87,
                      size: 26,
                    ),
                    const Flexible(
                      flex: 3,
                      child: Text(
                        "¿A dónde vas?",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: SizedBox(
                          height: 34,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.watch_later,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      "Reservar",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.expand_more,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
