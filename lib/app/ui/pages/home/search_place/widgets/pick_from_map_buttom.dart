import 'package:app_transport/app/ui/pages/home/search_place/search_place_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';

class PickFromMapButton extends ConsumerWidget {
  const PickFromMapButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, ref) {
    final originHasFocus = ref.select(
      searchProvider.select((_) => _.originHasFocus),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pop(
            context,
            PickFromMapResponse(originHasFocus),
          );
        },
        child: Container(
          alignment: Alignment.centerLeft,
          height: 55,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xFF1ed760),
                radius: 15,
                child: Icon(
                  Icons.location_pin,
                  size: 19,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "Buscar ${originHasFocus ? 'origen' : 'destino'} en mapa",
                  style: const TextStyle(
                      color: Color(0xFF242527),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
