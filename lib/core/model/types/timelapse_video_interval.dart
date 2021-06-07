import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class TimeLapseVideoInterval {
  final String _name;

  const TimeLapseVideoInterval._(this._name);

  @override
  String toString() {
    return _name;
  }

  static TimeLapseVideoInterval parse(String str) {
    switch (str) {
      case "0.5":
        return TimeLapseVideoInterval.t_0_5s;
      case "1":
        return TimeLapseVideoInterval.t_1s;
      case "2":
        return TimeLapseVideoInterval.t_2s;
      case "5":
        return TimeLapseVideoInterval.t_5s;
      case "10":
        return TimeLapseVideoInterval.t_10s;
      case "30":
        return TimeLapseVideoInterval.t_30s;
      case "60":
        return TimeLapseVideoInterval.t_60s;
      default:
        return Unknown;
    }
  }

  static const TimeLapseVideoInterval Unknown = TimeLapseVideoInterval._('Unknown');
  static const TimeLapseVideoInterval t_0_5s = TimeLapseVideoInterval._('0.5');
  static const TimeLapseVideoInterval t_1s = TimeLapseVideoInterval._('1');
  static const TimeLapseVideoInterval t_2s = TimeLapseVideoInterval._('2');
  static const TimeLapseVideoInterval t_5s = TimeLapseVideoInterval._('5');
  static const TimeLapseVideoInterval t_10s = TimeLapseVideoInterval._('10');
  static const TimeLapseVideoInterval t_30s = TimeLapseVideoInterval._('30');
  static const TimeLapseVideoInterval t_60s = TimeLapseVideoInterval._('60');

  static const listItems = <TimeLapseVideoInterval>[
    Unknown,
    t_0_5s,
    t_1s,
    t_2s,
    t_5s,
    t_10s,
    t_30s,
    t_60s
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Video Timelapse Duration'),
              trailing: DropdownButton<TimeLapseVideoInterval>(
                value: settings.timeLapseVideoInterval,
                items: TimeLapseVideoInterval.listItems
                    .map((TimeLapseVideoInterval value) => DropdownMenuItem<TimeLapseVideoInterval>(value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (TimeLapseVideoInterval newValue) {
                  settings.timeLapseVideoInterval = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
