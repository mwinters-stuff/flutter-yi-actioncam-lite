import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';

abstract class CameraServiceEvent extends Equatable {
  const CameraServiceEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends CameraServiceEvent {}

class Connected extends CameraServiceEvent {
  final CameraService cameraService;

  const Connected({@required this.cameraService});

  @override
  List<Object> get props => [cameraService];

  @override
  String toString() => 'Connected';
}

class Connect extends CameraServiceEvent {
  final BuildContext context;
  const Connect({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'Connect';
}

class Disconnect extends CameraServiceEvent {
  final BuildContext context;
  Disconnect({@required this.context}) : assert(context != null);

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'Disconnect';

}
