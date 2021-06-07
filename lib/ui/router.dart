import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_state.dart';
import 'package:flutter_yi_actioncam_lite/core/utils/constants.dart';
import 'package:flutter_yi_actioncam_lite/ui/files_screen.dart';
import 'package:flutter_yi_actioncam_lite/ui/home_screen.dart';
import 'package:flutter_yi_actioncam_lite/ui/image_preview_screen.dart';
import 'package:flutter_yi_actioncam_lite/ui/settings_screen.dart';
import 'package:flutter_yi_actioncam_lite/ui/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.RouteName:
        return MaterialPageRoute(
            builder: (_) => BlocBuilder<CameraServiceBloc, CameraServiceState>(
                    builder: (context, state) {
                  if (state is InitialState) {
                    return SplashScreen();
                  }
                  return HomeScreen();
                }));
      case SettingsScreen.RouteName:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case ImagePreviewScreen.RouteName:
        return MaterialPageRoute(
            builder: (_) => ImagePreviewScreen(settings.arguments));
      case FilesScreen.RouteName:
        return MaterialPageRoute(builder: (_) => FilesScreen());

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
