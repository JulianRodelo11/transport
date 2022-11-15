import 'package:app_transport/app/ui/pages/home/controller/home_state.dart';
import 'package:app_transport/app/ui/pages/home/widgets/buttons/timeline_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import '../home_page.dart' show homeProvider;

class OriginAndDestination extends ConsumerWidget {
  const OriginAndDestination({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    // only build if the origin and destination have changed
    final controller = ref.watch(
      homeProvider.select((state) {
        return state.origin != null && state.destination != null;
      }),
    );
    if (!controller.originAndDestinationReady) {
      return Container();
    }
    return _View(state: controller.state);
  }
}

class _View extends StatelessWidget {
  const _View({Key? key, required this.state}) : super(key: key);
  final HomeState state;

  @override
  Widget build(BuildContext context) {
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
