import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/home_controller.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
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
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        '¡Hola, Julian!',
        style: TextStyle(color: Colors.black),
      ),
      centerTitle: true,
    );
  }
}
