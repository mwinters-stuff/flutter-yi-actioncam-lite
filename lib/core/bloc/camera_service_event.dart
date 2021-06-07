import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';

abstract class CameraConnectedEvent extends Equatable {
  const CameraConnectedEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends CameraConnectedEvent {}

class Connected extends CameraConnectedEvent {
  final CameraService cameraService;

  const Connected({@required this.cameraService});

  @override
  List<Object> get props => [cameraService];

  @override
  String toString() => 'Connected';
}

class Connect extends CameraConnectedEvent {
  final BuildContext context;
  const Connect({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'Connect';
}

//class Connecting extends CameraConnectedEvent {}

class Disconnect extends CameraConnectedEvent {}

class Disconnected extends CameraConnectedEvent {}
