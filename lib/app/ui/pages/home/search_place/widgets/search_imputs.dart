import 'package:app_transport/app/ui/pages/home/search_place/search_place_controller.dart';
import 'package:app_transport/app/ui/pages/home/search_place/widgets/search_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchImputs extends StatelessWidget {
  const SearchImputs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller =
        Provider.of<SearchPlaceController>(context, listen: false);
    return Column(
      children: [
        SearchInput(
          controllerorigin: controller.originController,
          focusNodeorigin: controller.originfocusNode,
          placeholderorigin: 'Origen',
          onChangedorigin: controller.onQueryChange,
          onClearOrigin: controller.clearQuery,
          controllerdestination: controller.destinationController,
          focusNodedestination: controller.destinationfocusNode,
          placeholderdestination: 'Destino',
          onChangeddestination: controller.onQueryChange,
          onClearDestination: controller.clearQuery,
        ),
      ],
    );
  }
}
