import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartSessionState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialStartSessionState extends StartSessionState {}

class StartSessionDataState extends StartSessionState {
  final String rtspUrl;
  final int sessionId;

  StartSessionDataState({@required this.sessionId, @required this.rtspUrl}) : assert(sessionId != null && rtspUrl != null);

  @override
  List<Object> get props => [sessionId, rtspUrl];
}

class StartSessionClosedState extends StartSessionState{}