import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../controller/home_controller.dart';

class MapView extends StatelessWidget {
  const MapView({Key? key}) : super(key: key);

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
        return GoogleMap(
          markers: state.markers.values.toSet(),
          polylines: state.polylines.values.toSet(),
          onMapCreated: controller.onMapCreated,
          initialCameraPosition: initialCameraPosition,
          myLocationButtonEnabled: false,
          myLocationEnabled: false,
          zoomControlsEnabled: false,
          compassEnabled: false,
          rotateGesturesEnabled: false,
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
