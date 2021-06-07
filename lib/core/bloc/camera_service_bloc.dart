import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_event.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/camera_service_state.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/start_session_bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/services/camera_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraServiceBloc extends Bloc<CameraServiceEvent, CameraServiceState> {
  final CameraService cameraService;

  CameraServiceBloc({@required this.cameraService})
      : assert(cameraService != null);

  @override
  CameraServiceState get initialState => InitialState();

  @override
  Stream<CameraServiceState> mapEventToState(
    CameraServiceEvent event,
  ) async* {
    if (event is AppStarted) {
      await Future.delayed(Duration(seconds: 2));
      yield DisconnectedState();
    }

    if (event is Connect) {
      yield ConnectingState();
//      CameraService cameraService = CameraService();
      await Future.delayed(Duration(seconds: 2));
      if (await cameraService.connect(event.context)) {
        yield ConnectedState();
      } else {
        yield DisconnectedState();
      }
    }

    if (event is Disconnect) {
      yield DisconnectingState();
      cameraService.disconnect();
      BlocProvider.of<StartSessionBloc>(event.context)
          .add(StartSessionClosedEvent());
      BlocProvider.of<BatteryQuantityBloc>(event.context)
          .add(BatteryQuantityClosedEvent());
      await Future.delayed(Duration(seconds: 2));
      yield DisconnectedState();
    }
  }
}
