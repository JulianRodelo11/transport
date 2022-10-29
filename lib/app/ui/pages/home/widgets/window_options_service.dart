import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
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
    return Stack(
      children: [
        Container(
          height: 340,
          width: double.infinity,
          color: Colors.white,
        ),
      ],
    );
  }
}
