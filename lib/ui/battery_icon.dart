import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BatteryIcon extends StatelessWidget {
  final batteryIcons = <IconData>[
    MdiIcons.batteryOutline,
    MdiIcons.battery10,
    MdiIcons.battery20,
    MdiIcons.battery30,
    MdiIcons.battery40,
    MdiIcons.battery50,
    MdiIcons.battery60,
    MdiIcons.battery70,
    MdiIcons.battery80,
    MdiIcons.battery90,
    MdiIcons.battery
  ];

  final chargingIcons = <IconData>[
    MdiIcons.batteryChargingOutline,
    MdiIcons.batteryCharging10,
    MdiIcons.batteryCharging20,
    MdiIcons.batteryCharging30,
    MdiIcons.batteryCharging40,
    MdiIcons.batteryCharging50,
    MdiIcons.batteryCharging60,
    MdiIcons.batteryCharging70,
    MdiIcons.batteryCharging80,
    MdiIcons.batteryCharging90,
    MdiIcons.batteryCharging
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BatteryQuantityBloc, BatteryQuantityState>(
      builder: (context, state){
        if(state is BatteryPercentAdapterState){
          if (state.adapter) {
            return IconButton(icon: Icon(chargingIcons[state.percent ~/ 10]), onPressed:() => _onPressed(context));
          } else {
            return IconButton(icon: Icon(batteryIcons[state.percent ~/ 10]), onPressed: () => _onPressed(context));
          }
        }else{
          return IconButton(icon: Icon(MdiIcons.batteryOffOutline), onPressed: null);
        }
      });
  }

  void _onPressed(BuildContext context) {

  }
}
