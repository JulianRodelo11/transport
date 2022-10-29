import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/widgets/timeline_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OriginAndDestination extends StatelessWidget {
  const OriginAndDestination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originAndDestinationReady =
        context.select<HomeController, bool>((controller) {
      final state = controller.state;
      return state.origin != null && state.destination != null;
    });
    if (!originAndDestinationReady) {
      return Container();
    }

    final controller = Provider.of<HomeController>(
      context,
      listen: false,
    );
    final state = controller.state;
    final origin = state.origin!;
    final destination = state.destination!;

    return TimeLineTile(
      titleOrigin: origin.title,
      titleDestination: destination.title,
      descriptionOrigin: origin.address,
      descriptionDestination: destination.address,
      houseNumberOrigin: origin.houseNumber,
      houseNumberDestination: destination.houseNumber,
      resultTypeOrigin: origin.resultType,
      resultTypeDestination: destination.resultType,
      onPressedOrigin: () {},
      onPressedDestination: () {},
    );
  }
}
