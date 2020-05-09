import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class RecordMode {
  final String _name;

  const RecordMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static RecordMode parse(String str) {
    switch (str) {
      case 'record':
        return Normal;
      case 'record_timelapse':
        return Timelapse;
      default:
        return Unknown;
    }
  }

  static const RecordMode Unknown = RecordMode._('Unknown');
  static const RecordMode Normal = RecordMode._('record');
  static const RecordMode Timelapse = RecordMode._('record_timelapse');

  static const listItems = <RecordMode>[Normal, Timelapse];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
          title: Text('Record Mode'),
          trailing: DropdownButton<RecordMode>(
            value: settings.recordMode,
            items: RecordMode.listItems
                .map((RecordMode value) => DropdownMenuItem<RecordMode>(
                value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (RecordMode newValue) {
              settings.recordMode = newValue;
              settings.changed();
            },
          ),
        ));
  }
}
