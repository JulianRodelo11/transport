import 'package:app_transport/app/data/providers/local/geolocator_wrapper.dart';
import 'package:app_transport/app/data/providers/remote/routes_api.dart';
import 'package:app_transport/app/data/providers/repositories_impl/routes_repository_impl.dart';
import 'package:app_transport/app/ui/pages/home/controller/home_controller.dart';
import 'package:app_transport/app/ui/pages/home/widgets/google_map.dart';
import 'package:app_transport/app/ui/pages/home/widgets/origin_and_destination.dart';
import 'package:app_transport/app/ui/pages/home/widgets/sytem_bar_navigator.dart';
import 'package:app_transport/app/ui/pages/home/widgets/where_are_you_going_button.dart';
import 'package:app_transport/app/ui/pages/home/widgets/window_options_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) => HomeController(
        GeolocatorWrapper(),
        RoutesRepositoryImpl(
          RoutesApi(Dio()),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Column(
              children: [
                const OriginAndDestination(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Selector<HomeController, bool>(
                      selector: (_, controller) => controller.state.loading,
                      builder: (context, loading, loadingWidget) {
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
                ),
                const WindowOptionsService(),
                const WhereAreYouGoingButton(),
                const SystemBarNavigator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
