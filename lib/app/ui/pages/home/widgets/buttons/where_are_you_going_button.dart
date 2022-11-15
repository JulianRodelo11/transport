import 'package:app_transport/app/helpers/app_styles.dart';
import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:app_transport/app/ui/pages/home/utils/go_to_seacrh.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

class WhereAreYouGoingButton extends ConsumerWidget {
  const WhereAreYouGoingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(homeProvider);
    final state = controller.state;
    final hide = controller.originAndDestinationReady ||
        state.fetching ||
        state.pickFromMap != null;

    if (hide) {
      return Container();
    }
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          ListView(
            children: [
              Column(
                children: [
                  Text(
                    '¡Hola, Julian!',
                    style: kPoppinsSemibold.copyWith(
                      color: kBlack,
                      fontSize: 21,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: GestureDetector(
                      onTap: () => goToSearch(),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SvgPicture.asset(
                              'assets/search-2.svg',
                            ),
                            const Flexible(
                              flex: 3,
                              child: Text(
                                "¿A dónde vas?",
                                style: TextStyle(
                                  color: Color(0xFF4B4C4C),
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  height: 35,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.watch_later,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        Flexible(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Text(
                                              "Reserva",
                                              style: kPoppinsSemibold.copyWith(
                                                color: Colors.white,
                                                fontSize: 13,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.expand_more,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Positioned(
          //   bottom: 20,
          //   right: 20,
          //   child: FloatingActionButton(onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const MapView()),
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }
}
