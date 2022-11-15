import 'package:app_transport/app/helpers/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../home_page.dart';

class BannerFixedMarker extends ConsumerWidget {
  const BannerFixedMarker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final pickFromMap = ref.select(
      homeProvider.select((_) => _.pickFromMap),
    );
    final controller = homeProvider.read;

    if (pickFromMap == null) {
      return Container();
    }

    final place = pickFromMap.place;
    final dragging = pickFromMap.dragging;

    return Expanded(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          top: false,
          child: Stack(
            children: [
              ListView(
                children: [
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Text(
                          'Establecer punto de ${pickFromMap.isOrigin ? 'partida' : 'destino'}',
                          style: kPoppinsMedium.copyWith(
                            fontSize: 16,
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
                                  SvgPicture.asset(
                                    'assets/search-2.svg',
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  place != null && !dragging
                                      ? Expanded(
                                          child: Text(
                                            pickFromMap.place!.title,
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 15,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      : dragging
                                          ? const Text('')
                                          : const Text(''),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: pickFromMap.place != null
                      ? controller.confirmOriginOrDestination
                      // () => goToSearch()
                      : null,
                  elevation: 0,
                  backgroundColor: pickFromMap.place != null
                      ? const Color(0xFF1ed760)
                      : const Color(0xFFe8ece4),
                  child: pickFromMap.place != null
                      ? const Icon(CupertinoIcons.arrow_right)
                      : const Icon(
                          CupertinoIcons.arrow_right,
                          color: Colors.grey,
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
