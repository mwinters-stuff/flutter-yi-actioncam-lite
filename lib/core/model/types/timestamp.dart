import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:flutter_yi_actioncam_lite/core/model/types/types.dart';
import 'package:provider/provider.dart';

class Timestamp {
  final String _name;

  const Timestamp._(this._name);

  @override
  String toString() {
    return _name;
  }

  static Timestamp parse(String str) {
    switch (str) {
      case "off":
        return Timestamp.Off;
      case "time":
        return Timestamp.Time;
      case "date":
        return Timestamp.Date;
      case "date/time":
        return Timestamp.DateAndTime;
      default:
        return Unknown;
    }
  }

  static const Timestamp Unknown = Timestamp._('Unknown');
  static const Timestamp Off = Timestamp._('off');
  static const Timestamp Time = Timestamp._('time');
  static const Timestamp Date = Timestamp._('date');
  static const Timestamp DateAndTime = Timestamp._('date/time');

  static const listItems = <Timestamp>[Unknown, Off, Time, Date, DateAndTime];

  static Widget getWidget(VideoOrPhoto usage) => _Widget(usage);
}

class _Widget extends StatelessWidget {
  final VideoOrPhoto _usage;

  _Widget(this._usage);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text((_usage == VideoOrPhoto.video ? 'Video' : 'Photo') +
                  ' Timestamp'),
              trailing: DropdownButton<Timestamp>(
                value: (_usage == VideoOrPhoto.video
                    ? settings.videoTimestamp
                    : settings.photoTimestamp),
                items: Timestamp.listItems
                    .map((Timestamp value) => DropdownMenuItem<Timestamp>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (Timestamp newValue) {
                  switch (_usage) {
                    case VideoOrPhoto.photo:
                      settings.photoTimestamp = newValue;
                      break;
                    case VideoOrPhoto.video:
                      settings.videoTimestamp = newValue;
                      break;
                  }
                  settings.changed();
                },
              ),
            ));
  }
}
