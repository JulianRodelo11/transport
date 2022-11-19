import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapLocationHome extends ConsumerWidget {
  const MapLocationHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(homeProvider);
    final state = controller.state;
    final hide = controller.originAndDestinationReady ||
        state.fetching ||
        state.pickFromMap != null;

    if (hide) {
      return Container();
    }
    return Positioned(
      bottom: 10,
      right: 10,
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0.0, 1.0),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: IconButton(
          onPressed: controller.goToMyPosition,
          icon: SvgPicture.asset(
            'assets/crosshair-3.svg',
          ),
        ),
      ),
    );
  }
}
