import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_connected_event.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_connected_repository.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_connected_state.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';


class CameraConnectedBloc extends Bloc<CameraConnectedEvent, CameraConnectedState> {
  final CameraConnectedRepository cameraConnectedRepository;

  CameraConnectedBloc({@required this.cameraConnectedRepository}) : assert(cameraConnectedRepository != null);

  @override
  CameraConnectedState get initialState => InitialCameraConnectedState();

  @override
  Stream<CameraConnectedState> mapEventToState(
    CameraConnectedEvent event,
  ) async* {
    if(event is AppStarted){
      await Future.delayed(Duration(seconds: 2));
      yield DisconnectedCameraConnectedState();
    }

//    if(event is Connected){
//      cameraConnectedRepository.cameraService = event.cameraService;
//      yield ConnectedCameraConnectedState();
//    }

    if(event is Connect){
      yield ConnectingCameraConnectedState();
      CameraService cameraService = CameraService();
      await Future.delayed(Duration(seconds: 2));
      if(await cameraService.connect(event.context)) {
        cameraConnectedRepository.cameraService = cameraService;
        yield ConnectedCameraConnectedState();
      }else{
        cameraConnectedRepository.cameraService = null;
        yield DisconnectedCameraConnectedState();
      }
    }


    if(event is Disconnect){
      yield DisconnectingCameraConnectedState();
      cameraConnectedRepository.cameraService?.disconnect();
      cameraConnectedRepository.cameraService = null;
      await Future.delayed(Duration(seconds: 2));
      yield DisconnectedCameraConnectedState();
    }

    if(event is Disconnected){
      cameraConnectedRepository.cameraService = null;
      yield DisconnectedCameraConnectedState();
    }
  }
}
