import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_bloc.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_event.dart';
import 'package:flutterYiActionCameraLite/provider_setup.dart';
import 'package:flutterYiActionCameraLite/ui/home_screen.dart';
import 'package:flutterYiActionCameraLite/ui/router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(MultiRepositoryProvider(
    providers: repositories,
    child: MultiBlocProvider(
      providers: blocs,
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CameraServiceBloc>(context).add(AppStarted());
    return MaterialApp(title: 'Yi Action Camera Lite', onGenerateRoute: Router.generateRoute, initialRoute: HomeScreen.RouteName);
  }
}
