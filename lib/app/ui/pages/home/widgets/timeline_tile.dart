import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String contentOrigin = '';
String contentDestination = '';

class TimeLineTile extends StatelessWidget {
  final dynamic descriptionOrigin;
  final dynamic descriptionDestination;
  final String titleOrigin;
  final String titleDestination;
  final dynamic houseNumberOrigin;
  final dynamic houseNumberDestination;
  final String resultTypeOrigin;
  final String resultTypeDestination;
  final VoidCallback onPressedOrigin;
  final VoidCallback onPressedDestination;
  const TimeLineTile({
    Key? key,
    required this.resultTypeOrigin,
    required this.resultTypeDestination,
    this.descriptionOrigin,
    required this.titleOrigin,
    this.houseNumberOrigin,
    required this.onPressedOrigin,
    this.descriptionDestination,
    required this.titleDestination,
    this.houseNumberDestination,
    required this.onPressedDestination,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (resultTypeOrigin == "place") {
      contentOrigin = titleOrigin;
    } else if (resultTypeOrigin == "houseNumber") {
      contentOrigin = '$descriptionOrigin' '-$houseNumberOrigin';
    }
    if (resultTypeDestination == "place") {
      contentDestination = titleDestination;
    } else if (resultTypeDestination == "houseNumber") {
      contentDestination = '$descriptionDestination' '-$houseNumberDestination';
    }

    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Padding(
        padding:
            const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Column(
          children: [
            Container(
              width: size.width,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFe6ebf1),
              ),
              child: RawMaterialButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: context.read<HomeController>().clearData,
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        contentOrigin,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 12,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          contentDestination,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.account_circle_rounded,
                          color: Colors.black87,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
