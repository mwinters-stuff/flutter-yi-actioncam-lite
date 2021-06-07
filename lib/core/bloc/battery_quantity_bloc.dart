import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class BatteryQuantityBloc extends Bloc<BatteryQuantityEvent, BatteryQuantityState> {
  int _percent = 0;
  bool _adapter = false;

  @override
  BatteryQuantityState get initialState => InitialBatteryQuantityState();

  @override
  Stream<BatteryQuantityState> mapEventToState(
    BatteryQuantityEvent event,
  ) async* {
    if(event is BatteryPercentAdapterEvent){
      _percent = event.percent;
      _adapter = event.adapter;
      yield BatteryPercentAdapterState(percent: _percent, adapter: _adapter);
    }
    if(event is BatteryPercentEvent){
      _percent = event.percent;
      yield BatteryPercentAdapterState(percent: _percent, adapter: _adapter);
    }
    if(event is BatteryAdapterEvent){
      _adapter = event.adapter;
      yield BatteryPercentAdapterState(percent: _percent, adapter: _adapter);
    }
    if(event is BatteryQuantityClosedEvent){
      yield BatteryQuantityClosedState();
    }
  }
}
