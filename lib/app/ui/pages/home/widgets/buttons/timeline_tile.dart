import 'package:app_transport/app/ui/pages/home/utils/go_to_seacrh.dart';
import 'package:flutter/material.dart';

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

    return Positioned(
      top: 70,
      child: Container(
        width: 260,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: GestureDetector(
                onTap: () => goToSearch(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(
                    titleOrigin,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            const Icon(
              Icons.keyboard_arrow_right_outlined,
              color: Colors.black,
              size: 22,
            ),
            Flexible(
              child: GestureDetector(
                onTap: () => goToSearch(false),
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: Text(
                    titleDestination,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
