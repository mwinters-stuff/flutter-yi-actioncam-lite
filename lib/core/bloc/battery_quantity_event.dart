import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class BatteryQuantityEvent extends Equatable {
  const BatteryQuantityEvent();

  @override
  List<Object> get props => [];
}

class BatteryPercentAdapterEvent extends BatteryQuantityEvent{
  final int percent;
  final bool adapter;

  BatteryPercentAdapterEvent({@required this.percent, @required this.adapter}) : assert(percent != null && adapter != null);
  @override
  List<Object> get props => [percent, adapter];
}

class BatteryPercentEvent extends BatteryQuantityEvent{
  final int percent;

  BatteryPercentEvent({@required this.percent}) : assert(percent != null);
  @override
  List<Object> get props => [percent];
}

class BatteryAdapterEvent extends BatteryQuantityEvent{
  final bool adapter;

  BatteryAdapterEvent({@required this.adapter}) : assert(adapter != null);
  @override
  List<Object> get props => [adapter];
}


class BatteryQuantityClosedEvent extends BatteryQuantityEvent{}