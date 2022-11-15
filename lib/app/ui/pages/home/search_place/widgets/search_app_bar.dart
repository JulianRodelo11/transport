import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: SvgPicture.asset(
            'assets/x-2.svg',
          ),
          onPressed: () {
            FocusManager.instance.primaryFocus?.unfocus();
            Navigator.pop(
              context,
            );
          },
        ),
      ),
    );
  }
}
