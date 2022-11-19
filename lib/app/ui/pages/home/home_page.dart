import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/widgets/buttons/banner_fixed_marker.dart';
import 'package:app_transport/app/ui/pages/home/widgets/buttons/where_are_you_going_button.dart';
import 'package:app_transport/app/ui/pages/home/widgets/window_options_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'controller/home_state.dart';
import 'widgets/google_map.dart';

final homeProvider = StateProvider<HomeController, HomeState>(
  (_) => HomeController(),
);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Consumer(
              builder: (context, ref, loadingWidget) {
                // only rebuild if the loading field changes
                final loading = ref.select(
                  homeProvider.select((_) => _.loading),
                );
                if (loading) {
                  return loadingWidget!;
                }
                return const MapView();
              },
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          const WindowOptionsService(),
          const WhereAreYouGoingButton(),
          const BannerFixedMarker(),
        ],
      ),
    );
  }
}
