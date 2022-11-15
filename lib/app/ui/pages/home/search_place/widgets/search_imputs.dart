import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_input.dart';
import 'package:flutter/material.dart';

class SearchImputs extends StatelessWidget {
  const SearchImputs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = searchProvider.read;
    return Column(
      children: [
        SearchInput(
          controller: controller.originController,
          focusNode: controller.originFocusNode,
          placeholder: 'Lugar de partida',
          onChanged: controller.onQueryChanged,
          onClear: controller.clearQuery,
        ),
        SearchInput(
          controller: controller.destinationController,
          focusNode: controller.destinationFocusNode,
          placeholder: 'Lugar de llegada',
          onChanged: controller.onQueryChanged,
          onClear: controller.clearQuery,
        ),
      ],
    );
  }
}
