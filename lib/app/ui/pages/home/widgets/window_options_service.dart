import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iconsax/iconsax.dart';

class WindowOptionsService extends ConsumerWidget {
  const WindowOptionsService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(
      homeProvider.select((state) {
        return state.origin != null && state.destination != null;
      }),
    );
    //final time = controller.state.routes?.duration;
    //final distance = controller.state.routes?.length;

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
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Conoce más sobre la tarífa',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.info,
                              color: Colors.black,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: SizedBox(
                                  height: 47,
                                  width: 87,
                                  child: Image.asset('assets/UberX-3.png'),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 5.0,
                                              bottom: 2.0,
                                            ),
                                            child: Text(
                                              'Económico',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 10.0,
                                              bottom: 2,
                                            ),
                                            child: Text(
                                              'COP 14.500',
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 5.0,
                                              top: 3,
                                            ),
                                            child: Text(
                                              '---',
                                              //distanceFormat(destination!),
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 10.0,
                                              top: 3.0,
                                            ),
                                            child: Text(
                                              'Tiempo: 23 min',
                                              style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 8,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: SizedBox(
                                    height: 47,
                                    width: 87,
                                    child: Image.asset('assets/UberX-3.png'),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 5.0,
                                                bottom: 2.0,
                                              ),
                                              child: Text(
                                                'Premium',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 10.0,
                                                bottom: 2,
                                              ),
                                              child: Text(
                                                'COP 18.000',
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 5.0,
                                                top: 3,
                                              ),
                                              child: Text(
                                                '---',
                                                //distanceFormat(destination),
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13.5,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                right: 10.0,
                                                top: 3.0,
                                              ),
                                              child: Text(
                                                '---',
                                                // time.toString(),
                                                style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 13.5,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                            ),
                            child: SizedBox(
                              height: 55,
                              width: 260,
                              child: GFBorder(
                                radius: const Radius.circular(10),
                                color: Colors.black54,
                                dashedLine: const [4, 6],
                                type: GFBorderType.rRect,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: const [
                                    Icon(
                                      Iconsax.money5,
                                      // size: 25,
                                    ),
                                    Text(
                                      'Pago en efectivo',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Icon(Icons.expand_more),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 20.0,
                            ),
                            child: FloatingActionButton(
                              onPressed: () {},
                              elevation: 0,
                              backgroundColor: const Color(0xFF1ed760),
                              child: const Icon(CupertinoIcons.arrow_right),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
