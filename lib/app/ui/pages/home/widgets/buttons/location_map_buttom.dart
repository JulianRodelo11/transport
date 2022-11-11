import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapButtom extends StatelessWidget {
  const MapButtom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pickFromMap = context.select<HomeController, PickFromMap?>(
      (controller) => controller.state.pickFromMap,
    );

    if (pickFromMap == null) {
      return Container();
    }
    return Positioned(
      bottom: 10,
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
            onPressed: context.read<HomeController>().goToMyPosition,
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
