import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_event.dart';
import 'package:flutter_yi_actioncam_lite/provider_setup.dart';
import 'package:flutter_yi_actioncam_lite/ui/home_screen.dart';
import 'package:flutter_yi_actioncam_lite/ui/router.dart' as UIRouter;
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
    return MaterialApp(
        title: 'Yi Action Camera Lite',
        onGenerateRoute: UIRouter.Router.generateRoute,
        initialRoute: HomeScreen.RouteName);
  }
}
