import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class StartSessionBloc extends Bloc<StartSessionEvent, StartSessionState> {
  @override
  StartSessionState get initialState => InitialStartSessionState();

  @override
  Stream<StartSessionState> mapEventToState(
    StartSessionEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
