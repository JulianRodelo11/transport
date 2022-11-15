import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../home_page.dart' show homeProvider;

class CancelTravel extends ConsumerWidget {
  const CancelTravel({Key? key}) : super(key: key);

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
    return Positioned(
      top: 10,
      left: 10,
      child: SafeArea(
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
            onPressed: homeProvider.read.clearData,
            icon: SvgPicture.asset(
              'assets/x.svg',
            ),
          ),
        ),
      ),
    );
  }
}
