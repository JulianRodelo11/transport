import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SystemBarNavigator extends StatelessWidget {
  const SystemBarNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final originAndDestinationReady =
        context.select<HomeController, bool>((controller) {
      final state = controller.state;
      return state.origin != null && state.destination != null;
    });
    if (originAndDestinationReady) {
      return Container();
    }
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 50),
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Image.asset(
                  "assets/home.png",
                  color: const Color(0xFF242527),
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            Container(
              height: 20,
              width: 20,
              decoration: const BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Image.asset(
                "assets/history.png",
                color: Colors.black54,
                height: 25,
                width: 25,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 50),
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Image.asset(
                  "assets/acount.png",
                  color: Colors.black54,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
