import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WhereAreYouGoingButton extends StatelessWidget {
  const WhereAreYouGoingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originAndDestinationReady =
        context.select<HomeController, bool>((controller) {
      final state = controller.state;
      return state.origin != null && state.destination != null;
    });

    if (originAndDestinationReady) {
      return Container();
    }
    return Stack(
      children: [
        Container(
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 0),
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          color: Colors.white,
        ),
        Positioned.fill(
          top: 20,
          left: 19,
          right: 19,
          bottom: 180,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF242527),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Positioned.fill(
          top: 170,
          bottom: 90,
          left: 20,
          right: 20,
          child: GestureDetector(
            onTap: () async {
              final response =
                  await Get.to<SearchResponse>(() => const SearchPlacePage(),
                      transition: Transition.upToDown,
                      //duration: const Duration(milliseconds: 500),
                      curve: Curves.linearToEaseOut);
              if (response != null) {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    final controller = context.read<HomeController>();
                    controller.setOriginAndDestination(
                        response.origin, response.destination);
                  },
                );
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFe6ebf1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(
                    flex: 2,
                    child: Icon(
                      Icons.search,
                      color: Color(0xFF242527),
                      size: 35,
                    ),
                  ),
                  const Expanded(
                    flex: 7,
                    child: Text(
                      "¿A dónde vas?",
                      style: TextStyle(
                          color: Color(0xFF242527),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Flexible(
                    flex: 6,
                    child: GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        height: 45,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Icon(
                                  Icons.watch_later,
                                  color: Color(0xFF242527),
                                  size: 23,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.0),
                                child: Text(
                                  "Reservar",
                                  style: TextStyle(
                                    color: Color(0xFF242527),
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          top: 260,
          bottom: 20,
          left: 80,
          right: 205,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF1ed760),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/car_1.png",
                    color: Colors.white,
                    height: 32,
                    width: 32,
                    alignment: Alignment.center,
                  ),
                ),
                const Expanded(
                  child: Text(
                    "Carro",
                    style: TextStyle(
                      color: Color(0xFFffffff),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 260,
          bottom: 20,
          left: 205,
          right: 80,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/moto.png",
                    color: const Color(0xFF242527),
                    height: 25,
                    width: 25,
                    alignment: Alignment.center,
                  ),
                ),
                const Expanded(
                  child: Text(
                    "Moto",
                    style: TextStyle(
                      color: Color(0xFF242527),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
