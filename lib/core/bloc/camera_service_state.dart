import 'package:equatable/equatable.dart';

abstract class CameraConnectedState extends Equatable {
  const CameraConnectedState();
  @override
  List<Object> get props => [];
}

class InitialCameraConnectedState extends CameraConnectedState {
}

class ConnectedCameraConnectedState extends CameraConnectedState {

}

class ConnectingCameraConnectedState extends CameraConnectedState {

}

class DisconnectingCameraConnectedState extends CameraConnectedState {

}

class DisconnectedCameraConnectedState extends CameraConnectedState {

}
