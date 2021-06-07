import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class ScreenAutoLock {
  final String _name;

  const ScreenAutoLock._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ScreenAutoLock parse(String str) {
    switch (str) {
      case 'never':
        return s_Never;
      case '30s':
        return s_30s;
      case '60s':
        return s_60s;
      case '120s':
        return s_120s;
      default:
        return Unknown;
    }
  }

  static const ScreenAutoLock Unknown = ScreenAutoLock._('Unknown');
  static const ScreenAutoLock s_Never = ScreenAutoLock._('never');
  static const ScreenAutoLock s_30s = ScreenAutoLock._('30s');
  static const ScreenAutoLock s_60s = ScreenAutoLock._('60s');
  static const ScreenAutoLock s_120s = ScreenAutoLock._('120s');

  static const listItems = <ScreenAutoLock>[Unknown,s_Never, s_30s, s_60s, s_120s];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Screen Auto Lock'),
              trailing: DropdownButton<ScreenAutoLock>(
                value: settings.screenAutoLock,
                items: ScreenAutoLock.listItems
                    .map((ScreenAutoLock value) =>
                        DropdownMenuItem<ScreenAutoLock>(
                            value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (ScreenAutoLock newValue) {
                  settings.screenAutoLock = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
