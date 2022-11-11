import 'package:app_transport/app/ui/pages/home/widgets/buttons/location_map_buttom.dart';
import 'package:app_transport/app/ui/pages/home/widgets/fixed_marker.dart';
import 'package:app_transport/app/ui/pages/home/widgets/origin_and_destination.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';
import 'buttons/cancel_pick_from_map.dart';
import 'buttons/cancel_travel.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  var padding = EdgeInsets.zero;
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (_, controller, gpsMessageWidget) {
        final state = controller.state;

        if (!state.gpsEnabled) {
          return gpsMessageWidget!;
        }

        final initialCameraPosition = CameraPosition(
          target: LatLng(
            state.initialPosition!.latitude,
            state.initialPosition!.longitude,
          ),
          zoom: 15.4,
        );
        return Stack(
          alignment: Alignment.center,
          children: [
            GoogleMap(
              markers: state.markers.values.toSet(),
              polylines: state.polylines.values.toSet(),
              onMapCreated: (mapController) {
                controller.onMapCreated(mapController);
                // setState(
                //   () {
                //     padding = EdgeInsets.only(
                //       top: MediaQuery.of(context).size.height * 0.12,
                //       // bottom: 20,
                //     );
                //   },
                // );
              },
              initialCameraPosition: initialCameraPosition,
              myLocationButtonEnabled: false,
              myLocationEnabled: true,
              zoomControlsEnabled: false,
              compassEnabled: false,
              rotateGesturesEnabled: false,
              //padding: padding,
            ),
            // Positioned(
            //   top: 40,
            //   child: Container(
            //     height: 80,
            //     width: 350,
            //     decoration: BoxDecoration(
            //       color: Colors.black,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            // ),
            const OriginAndDestination(),
            const CancelPickFromMap(),
            const FixedMarker(),
            const CancelTravel(),
            const MapButtom(),
          ],
        );
      },
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Para usar la aplicación necesitamos tener acceso a tu ubicación.\n Por lo tanto debes habilitar el GPS",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                final controller = context.read<HomeController>();
                controller.turnOnGPS();
              },
              child: const Text("Encender GPS"),
            ),
          ],
        ),
      ),
    );
  }
}
