import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancelPickFromMap extends StatelessWidget {
  const CancelPickFromMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final visible = context.select<HomeController, bool>(
      (controller) => controller.state.pickFromMap != null,
    );
    if (!visible) {
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
            onPressed: context.read<HomeController>().cancelPickFromMap,
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
