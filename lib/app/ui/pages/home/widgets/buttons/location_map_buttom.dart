import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

import '../../home_page.dart' show homeProvider;

class MapButtom extends ConsumerWidget {
  const MapButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final data = ref.select(
      homeProvider.select((_) => _.pickFromMap),
    );

    final controller = homeProvider.read;

    if (data == null) {
      return Container();
    }
    return Positioned(
      top: 10,
      right: 10,
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
            onPressed: controller.goToMyPosition,
            icon: const Icon(
              Icons.gps_not_fixed_outlined,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
