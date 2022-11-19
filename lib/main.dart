import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/inject_dependencies.dart';
import 'package:app_transport/app/ui/routes/pages.dart';
import 'package:app_transport/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

void main() {
  injectDependencies();
  router.setDefaultTransition(router.Transition.fadeIn);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // Navigation bar
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.black, // Status bar
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
    );
  }
}
