import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class StartSessionEvent extends Equatable {
  const StartSessionEvent();

  @override
  List<Object> get props => [];
}

class StartSessionDataEvent extends StartSessionEvent{
  final String rtspUrl;
  final int sessionId;

  StartSessionDataEvent({@required this.sessionId, @required this.rtspUrl}) : assert(sessionId != null && rtspUrl != null);
  @override
  List<Object> get props => [sessionId, rtspUrl];

}
class StartSessionClosedEvent extends StartSessionEvent{}