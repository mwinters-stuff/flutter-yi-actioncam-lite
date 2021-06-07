import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class TimeLapsePhotoInterval {
  final String _name;

  const TimeLapsePhotoInterval._(this._name);

  @override
  String toString() {
    return _name;
  }

  static TimeLapsePhotoInterval parse(String str) {
    switch (str) {
      case "continue":
        return TimeLapsePhotoInterval.t_Continue;
      case "0.5 sec":
        return TimeLapsePhotoInterval.t_0_5s;
      case "1.0 sec":
        return TimeLapsePhotoInterval.t_1s;
      case "2.0 sec":
        return TimeLapsePhotoInterval.t_2s;
      case "5.0 sec":
        return TimeLapsePhotoInterval.t_5s;
      case "10.0 sec":
        return TimeLapsePhotoInterval.t_10s;
      case "30.0 sec":
        return TimeLapsePhotoInterval.t_30s;
      case "60.0 sec":
        return TimeLapsePhotoInterval.t_60s;
      case "2.0 min":
        return TimeLapsePhotoInterval.t_2m;
      case "5.0 min":
        return TimeLapsePhotoInterval.t_5m;
      case "10.0 min":
        return TimeLapsePhotoInterval.t_10m;
      case "30.0 min":
        return TimeLapsePhotoInterval.t_30m;
      case "60.0 min":
        return TimeLapsePhotoInterval.t_60m;
      default:
        return Unknown;
    }
  }

  static const TimeLapsePhotoInterval Unknown = TimeLapsePhotoInterval._('Unknown');
  static const TimeLapsePhotoInterval t_Continue = TimeLapsePhotoInterval._('continue');
  static const TimeLapsePhotoInterval t_0_5s = TimeLapsePhotoInterval._('0.5 sec');
  static const TimeLapsePhotoInterval t_1s = TimeLapsePhotoInterval._('1.0 sec');
  static const TimeLapsePhotoInterval t_2s = TimeLapsePhotoInterval._('2.0 sec');
  static const TimeLapsePhotoInterval t_5s = TimeLapsePhotoInterval._('5.0 sec');
  static const TimeLapsePhotoInterval t_10s = TimeLapsePhotoInterval._('10.0 sec');
  static const TimeLapsePhotoInterval t_30s = TimeLapsePhotoInterval._('30.0 sec');
  static const TimeLapsePhotoInterval t_60s = TimeLapsePhotoInterval._('60.0 sec');
  static const TimeLapsePhotoInterval t_2m = TimeLapsePhotoInterval._('2.0 min');
  static const TimeLapsePhotoInterval t_5m = TimeLapsePhotoInterval._('5.0 min');
  static const TimeLapsePhotoInterval t_10m = TimeLapsePhotoInterval._('10.0 min');
  static const TimeLapsePhotoInterval t_30m = TimeLapsePhotoInterval._('30.0 min');
  static const TimeLapsePhotoInterval t_60m = TimeLapsePhotoInterval._('60.0 min');

  static const listItems = <TimeLapsePhotoInterval>[
    Unknown,
  t_Continue,
  t_0_5s,
  t_1s,
  t_2s,
  t_5s,
  t_10s,
  t_30s,
  t_60s,
  t_2m,
  t_5m,
  t_10m,
  t_30m,
  t_60m,
   ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
            ListTile(
              title: Text('Photo Timelapse Interval'),
              trailing: DropdownButton<TimeLapsePhotoInterval>(
                value: settings.timeLapsePhotoInterval,
                items: TimeLapsePhotoInterval.listItems
                    .map((TimeLapsePhotoInterval value) =>
                    DropdownMenuItem<TimeLapsePhotoInterval>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (TimeLapsePhotoInterval newValue) {
                  settings.timeLapsePhotoInterval = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}


