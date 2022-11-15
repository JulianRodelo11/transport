import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

class WindowOptionsService extends ConsumerWidget {
  const WindowOptionsService({Key? key}) : super(key: key);

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
    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
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
        ),
      ),
    );
  }
}
