import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

import '../home_page.dart' show homeProvider;

class FixedMarker extends ConsumerWidget {
  const FixedMarker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final pickFromMap = ref.select(
      homeProvider.select((_) => _.pickFromMap),
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
