import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class BuzzerVolume {
  final String _name;

  const BuzzerVolume._(this._name);

  @override
  String toString() {
    return _name;
  }

  static BuzzerVolume parse(String str) {
    switch (str) {
      case 'high':
        return High;
      case 'low':
        return Low;
      case 'mute':
        return Mute;
      default:
        return Unknown;
    }
  }

  static const BuzzerVolume Unknown = BuzzerVolume._('Unknown');
  static const BuzzerVolume High = BuzzerVolume._('high');
  static const BuzzerVolume Low = BuzzerVolume._('low');
  static const BuzzerVolume Mute = BuzzerVolume._('mute');

  static const listItems = <BuzzerVolume>[Unknown, High, Low, Mute];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Buzzer Volume'),
              trailing: DropdownButton<BuzzerVolume>(
                value: settings.buzzerVolume,
                items: BuzzerVolume.listItems
                    .map((BuzzerVolume value) => DropdownMenuItem<BuzzerVolume>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (BuzzerVolume newValue) {
                  settings.buzzerVolume = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
