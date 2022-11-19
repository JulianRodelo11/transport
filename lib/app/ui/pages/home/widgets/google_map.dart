import 'package:app_transport/app/ui/pages/home/widgets/buttons/map_location_home.dart';
import 'package:app_transport/app/ui/pages/home/widgets/buttons/menu_bottom.dart';

import '../home_page.dart' show homeProvider;
import 'package:app_transport/app/ui/pages/home/widgets/buttons/cancel_pick_from_map.dart';
import 'package:app_transport/app/ui/pages/home/widgets/buttons/location_map_buttom.dart';
import 'package:app_transport/app/ui/pages/home/widgets/fixed_marker.dart';
import 'package:app_transport/app/ui/pages/home/widgets/origin_and_destination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'buttons/cancel_travel.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, gpsMessageWidget) {
        final controller = ref.watch(homeProvider);
        final state = controller.state;

        if (!state.gpsEnabled) {
          return gpsMessageWidget!;
        }

        final initialCameraPosition = CameraPosition(
          target: LatLng(
            state.initialPosition!.latitude,
            state.initialPosition!.longitude,
          ),
          zoom: 15.9,
        );
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            bottom: false,
            child: Stack(
              alignment: Alignment.center,
              children: [
                GoogleMap(
                  markers: state.markers.values.toSet(),
                  polylines: state.polylines.values.toSet(),
                  onMapCreated: (mapController) {
                    controller.onMapCreated(mapController);
                  },
                  initialCameraPosition: initialCameraPosition,
                  myLocationButtonEnabled: false,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  rotateGesturesEnabled: false,
                  mapToolbarEnabled: false,
                  onCameraMoveStarted: controller.onCameraMoveStarted,
                  onCameraMove: controller.onCameraMove,
                  onCameraIdle: controller.onCameraIdle,
                ),
                const OriginAndDestination(),
                const CancelPickFromMap(),
                const FixedMarker(),
                const CancelTravel(),
                const MapButtom(),
                const MenuBottom(),
                const MapLocationHome(),
              ],
            ),
          ),
        );
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "To use our app we need the access to your location,\n so you must enable the GPS",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                homeProvider.read.turnOnGPS();
              },
              child: const Text("Turn on GPS"),
            ),
          ],
        ),
      ),
    );
  }
}
