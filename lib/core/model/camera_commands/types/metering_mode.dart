import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class MeteringMode {
  final String _name;

  const MeteringMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static MeteringMode parse(String str) {
    switch (str) {
      case 'center':
        return Center;
      case 'average':
        return Average;
      case 'spot':
        return Spot;
      default:
        return Unknown;
    }
  }

  static const MeteringMode Unknown = MeteringMode._('Unknown');
  static const MeteringMode Center = MeteringMode._('center');
  static const MeteringMode Average = MeteringMode._('average');
  static const MeteringMode Spot = MeteringMode._('spot');

  static const listItems = <MeteringMode>[Center, Average, Spot];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
          title: Text('Metering Mode'),
          trailing: DropdownButton<MeteringMode>(
            value: settings.meteringMode,
            items: MeteringMode.listItems
                .map((MeteringMode value) => DropdownMenuItem<MeteringMode>(
                value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (MeteringMode newValue) {
              settings.meteringMode = newValue;
              settings.changed();
            },
          ),
        ));
  }
}

