import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BatteryQuantityBloc extends Bloc<BatteryQuantityEvent, BatteryQuantityState> {
  @override
  BatteryQuantityState get initialState => InitialBatteryQuantityState();

  @override
  Stream<BatteryQuantityState> mapEventToState(
    BatteryQuantityEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
