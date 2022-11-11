import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FixedMarker extends StatelessWidget {
  const FixedMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pickFromMap = context.select<HomeController, PickFromMap?>(
      (controller) => controller.state.pickFromMap,
    );

    if (pickFromMap == null) {
      return Container();
    }

    return Transform.translate(
      offset: const Offset(0, -20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
              ),
              Positioned.fill(
                top: 10,
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            height: 20,
            width: 3.5,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
