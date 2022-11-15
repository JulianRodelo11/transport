import 'dart:async';
import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/bottom_next.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_app_bar.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_imputs.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/page.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../domain/models/place.dart';
import 'package:flutter_meedu/meedu.dart';

final searchProvider = SimpleProvider(
  (_) => SearchPlaceController(_.arguments),
);

abstract class SearchResponse {}

class PickFromMapResponse extends SearchResponse {
  final bool isOrigin;
  PickFromMapResponse(this.isOrigin);
}

class OriginAndDestinationResponse extends SearchResponse {
  final Place origin, destination;
  OriginAndDestinationResponse(this.origin, this.destination);
}

class SearchPlacePage extends PageWithArgumentsWidget {
  const SearchPlacePage({Key? key}) : super(key: key);

  @override
  void onInit(RouteSettings settings) {
    searchProvider.setArguments(
      settings.arguments as SearchPlaceArguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SearchPlaceController>(
      provider: searchProvider,
      onAfterFirstLayout: (_, controller) => Timer(
        const Duration(milliseconds: 300),
        () {
          if (!controller.disposed) {
            controller.setInitialFocus();
          }
        },
      ),
      builder: (_, controller) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
                  Container(
                    height: 110,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              Container(
                                color: Colors.white,
                              ),
                              Positioned(
                                top: 30,
                                right: 15,
                                child: SvgPicture.asset(
                                  'assets/step-search.svg',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 4,
                          child: SearchImputs(),
                        )
                      ],
                    ),
                  ),
                  const Expanded(
                    child: SearchResults(),
                  ),
                  const BottomNext(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
