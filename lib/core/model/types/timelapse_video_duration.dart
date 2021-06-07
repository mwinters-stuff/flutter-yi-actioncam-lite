import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class TimeLapseVideoDuration {
  final String _name;

  const TimeLapseVideoDuration._(this._name);

  @override
  String toString() {
    return _name;
  }

  static TimeLapseVideoDuration parse(String str) {
    switch (str) {
      case "off":
        return TimeLapseVideoDuration.t_Off;
      case "6s":
        return TimeLapseVideoDuration.t_6s;
      case "8s":
        return TimeLapseVideoDuration.t_8s;
      case "10s":
        return TimeLapseVideoDuration.t_10s;
      case "20s":
        return TimeLapseVideoDuration.t_20s;
      case "30s":
        return TimeLapseVideoDuration.t_30s;
      case "60s":
        return TimeLapseVideoDuration.t_60s;
      case "120s":
        return TimeLapseVideoDuration.t_120s;
      default:
        return Unknown;
    }
  }

  static const TimeLapseVideoDuration Unknown = TimeLapseVideoDuration._('Unknown');
  static const TimeLapseVideoDuration t_Off = TimeLapseVideoDuration._('off');
  static const TimeLapseVideoDuration t_6s = TimeLapseVideoDuration._('6s');
  static const TimeLapseVideoDuration t_8s = TimeLapseVideoDuration._('8s');
  static const TimeLapseVideoDuration t_10s = TimeLapseVideoDuration._('10s');
  static const TimeLapseVideoDuration t_20s = TimeLapseVideoDuration._('20s');
  static const TimeLapseVideoDuration t_30s = TimeLapseVideoDuration._('30s');
  static const TimeLapseVideoDuration t_60s = TimeLapseVideoDuration._('60s');
  static const TimeLapseVideoDuration t_120s = TimeLapseVideoDuration._('120s');

  static const listItems = <TimeLapseVideoDuration>[
    Unknown,
    t_Off,
    t_6s,
    t_8s,
    t_10s,
    t_20s,
    t_30s,
    t_60s,
    t_120s,
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
            ListTile(
              title: Text('Video Timelapse Duration'),
              trailing: DropdownButton<TimeLapseVideoDuration>(
                value: settings.timeLapseVideoDuration,
                items: TimeLapseVideoDuration.listItems
                    .map((TimeLapseVideoDuration value) =>
                    DropdownMenuItem<TimeLapseVideoDuration>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (TimeLapseVideoDuration newValue) {
                  settings.timeLapseVideoDuration = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}



