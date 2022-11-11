import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WindowOptionsService extends StatelessWidget {
  const WindowOptionsService({Key? key}) : super(key: key);

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
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
              // focusElevation: 0.0,
              elevation: 0,
              backgroundColor: const Color(0xFF1ed760),
              child: const Icon(CupertinoIcons.arrow_right),
            ),
          ),
        ],
      ),
    );
  }
}
