
import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';

import 'package:provider/provider.dart';

class AutoPowerOff {
  final String _name;

  const AutoPowerOff._(this._name);

  @override
  String toString() {
    return _name;
  }

  static AutoPowerOff parse(String str){
    switch(str){
      case 'off':
        return a_Off;
      case '3 minutes':
        return a_3m;
      case '5 minutes':
        return a_5m;
      case '10 minutes':
        return a_10m;
      default:
        return Unknown;
    }
  }

  static const AutoPowerOff Unknown = AutoPowerOff._('Unknown');
  static const AutoPowerOff a_Off = AutoPowerOff._('off');
  static const AutoPowerOff a_3m = AutoPowerOff._('3 minutes');
  static const AutoPowerOff a_5m = AutoPowerOff._('5 minutes');
  static const AutoPowerOff a_10m = AutoPowerOff._('10 minutes');

  static const listItems = <AutoPowerOff>[
    Unknown,
    a_Off, a_3m, a_5m, a_10m
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
          ListTile(title: Text('Auto Power Off'),
            trailing: DropdownButton<AutoPowerOff>(
              value: settings.autoPowerOff,
              items: AutoPowerOff.listItems.map((AutoPowerOff value) => DropdownMenuItem<AutoPowerOff> (
                value: value,
                child: Text(value.toString())
              )).toList(),
              onChanged: (AutoPowerOff newValue){
                settings.autoPowerOff = newValue;
                settings.changed();
              },
            ),
          ));
  }

}