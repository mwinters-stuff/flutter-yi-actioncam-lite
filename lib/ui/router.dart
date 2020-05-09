import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/utils/constants.dart';
import 'package:flutterYiActionCameraLite/ui/home_screen.dart';
import 'package:flutterYiActionCameraLite/ui/splash_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.splashScreenRouteName:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Constants.homeScreenRouteName:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
