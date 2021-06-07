import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BatteryQuantityState extends Equatable {
  const BatteryQuantityState();
  @override
  List<Object> get props => [];
}

class InitialBatteryQuantityState extends BatteryQuantityState {
  @override
  List<Object> get props => [];
}

class BatteryPercentAdapterState extends BatteryQuantityState {
  final int percent;
  final bool adapter;

  BatteryPercentAdapterState({@required this.percent, @required this.adapter}) : assert(percent != null && adapter != null);
  @override
  List<Object> get props => [percent,adapter];
}

class BatteryQuantityClosedState extends BatteryQuantityState{}

