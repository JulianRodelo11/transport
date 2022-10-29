import 'package:app_transport/app/ui/pages/home/home_page.dart';
import 'package:app_transport/app/ui/pages/home/request_permission/request_permission_page.dart';
import 'package:app_transport/app/ui/pages/home/splash/splash_page.dart';
import 'package:app_transport/app/ui/routes/routes.dart';
import 'package:flutter/widgets.dart';

Map<String, Widget Function(BuildContext)> appRoutes() {
  return {
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.PERMISSIONS: (_) => const RequestPermissionPage(),
    Routes.HOME: (_) => const HomePage(),
  };
}
