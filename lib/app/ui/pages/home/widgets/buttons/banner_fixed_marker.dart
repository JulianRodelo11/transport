import 'package:app_transport/app/helpers/app_styles.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerFixedMarker extends StatelessWidget {
  final String? text;
  const BannerFixedMarker({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pickFromMap = context.select<HomeController, PickFromMap?>(
      (controller) => controller.state.pickFromMap,
    );

    if (pickFromMap == null) {
      return Container();
    }
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Text(
                    'Establecer punto de partida',
                    style: kPoppinsMedium.copyWith(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20.0, left: 20, right: 20, bottom: 20),
                  child: CupertinoButton(
                    onPressed: (() {}),
                    padding: EdgeInsets.zero,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            CupertinoIcons.location_fill,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          text != null
                              ? Text(
                                  text!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontSize: 15,
                                  ),
                                )
                              : const Text(''),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {},
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
