import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';

class CancelTravel extends StatelessWidget {
  const CancelTravel({Key? key}) : super(key: key);

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
            onPressed: context.read<HomeController>().clearData,
            icon: const Icon(
              CupertinoIcons.arrow_left,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
