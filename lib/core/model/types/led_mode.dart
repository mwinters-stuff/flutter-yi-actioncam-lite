import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class LEDMode {
  final String _name;

  const LEDMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static LEDMode parse(String str) {
    switch (str) {
      case 'all enable':
        return AllOn;
      case 'all disable':
        return AllOff;
      case 'status enable':
        return StatusLightOnly;
      default:
        return Unknown;
    }
  }

  static const LEDMode Unknown = LEDMode._('Unknown');
  static const LEDMode AllOn = LEDMode._('all enable');
  static const LEDMode AllOff = LEDMode._('all disable');
  static const LEDMode StatusLightOnly = LEDMode._('status enable');

  static const listItems = <LEDMode>[Unknown, AllOn, AllOff, StatusLightOnly];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('LED Mode'),
              trailing: DropdownButton<LEDMode>(
                value: settings.ledMode,
                items: LEDMode.listItems
                    .map((LEDMode value) => DropdownMenuItem<LEDMode>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (LEDMode newValue) {
                  settings.ledMode = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
