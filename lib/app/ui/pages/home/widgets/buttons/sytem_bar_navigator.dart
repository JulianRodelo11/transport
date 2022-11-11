import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SystemBarNavigator extends StatelessWidget {
  const SystemBarNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hide = context.select<HomeController, bool>((controller) {
      final state = controller.state;
      final originAndDestinationReady =
          state.origin != null && state.destination != null;
      return originAndDestinationReady ||
          state.fetching ||
          state.pickFromMap != null;
    });
    if (hide) {
      return Container();
    }
    return Container(
      height: 55,
      color: Colors.white,
    );
  }
}
