import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelPickFromMap extends ConsumerWidget {
  const CancelPickFromMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final visible = ref.select(
      homeProvider.select((_) => _.pickFromMap != null),
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
            onPressed: homeProvider.read.cancelPickFromMap,
            icon: SvgPicture.asset(
              'assets/x.svg',
            ),
          ),
        ),
      ),
    );
  }
}
