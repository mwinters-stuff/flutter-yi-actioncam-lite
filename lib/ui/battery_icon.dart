import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/get_battery_quantity.dart';
import 'package:flutterinfluxdb/core/services/camera_service.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

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
    return Consumer<CameraService>(
        builder: (context, cameraService, widget) =>
            Consumer<GetBatteryQuantity>(
                builder: (context, batteryClient, widget) {
              var icon;
              if (cameraService.connected && batteryClient.batteryQuantity != null) {
                if(batteryClient.adapterStatus) {
                  return IconButton(icon: Icon(
                      chargingIcons[batteryClient.batteryQuantity ~/ 10]),
                      onPressed: () => cameraService.send(batteryClient));
                }else{
                  return IconButton(icon: Icon(batteryIcons[batteryClient.batteryQuantity ~/ 10]), onPressed: () => cameraService.send(batteryClient));
                }
              } else {
                return IconButton(icon: Icon(MdiIcons.batteryOffOutline), onPressed: null);// Icon(MdiIcons.battery);
              }
            }));
  }
}
