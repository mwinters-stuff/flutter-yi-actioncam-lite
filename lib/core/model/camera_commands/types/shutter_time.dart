import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class ShutterTime {
  final String _name;

  const ShutterTime._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ShutterTime parse(String str) {
    switch (str) {
      case 'auto':
        return st_Auto;
      case '2s':
        return st_2s;
      case '5s':
        return st_5s;
      case '10s':
        return st_10s;
      case '20s':
        return st_20s;
      case '30s':
        return st_30s;

      default:
        return Unknown;
    }
  }

  static const ShutterTime Unknown = ShutterTime._('Unknown');
  static const ShutterTime st_Auto = ShutterTime._('auto');
  static const ShutterTime st_2s = ShutterTime._('2s');
  static const ShutterTime st_5s = ShutterTime._('5s');
  static const ShutterTime st_10s = ShutterTime._('10s');
  static const ShutterTime st_20s = ShutterTime._('20s');
  static const ShutterTime st_30s = ShutterTime._('30s');

  static const listItems = <ShutterTime>[st_Auto, st_2s,
    st_5s,
    st_10s,
    st_20s,
    st_30s];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
            ListTile(
              title: Text('Shutter Time'),
              trailing: DropdownButton<ShutterTime>(
                value: settings.photoShutterTime,
                items: ShutterTime.listItems
                    .map((ShutterTime value) =>
                    DropdownMenuItem<ShutterTime>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (ShutterTime newValue) {
                  settings.photoShutterTime = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}

