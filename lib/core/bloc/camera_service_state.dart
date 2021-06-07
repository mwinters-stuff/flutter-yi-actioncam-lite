import 'package:equatable/equatable.dart';

abstract class CameraServiceState extends Equatable {
  const CameraServiceState();
  @override
  List<Object> get props => [];
}

class InitialState extends CameraServiceState {
}

class ConnectedState extends CameraServiceState {

}

class ConnectingState extends CameraServiceState {

}

class DisconnectingState extends CameraServiceState {

}

class DisconnectedState extends CameraServiceState {

}
