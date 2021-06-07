import 'package:equatable/equatable.dart';

abstract class BatteryQuantityState extends Equatable {
  const BatteryQuantityState();
}

class InitialBatteryQuantityState extends BatteryQuantityState {
  @override
  List<Object> get props => [];
}
