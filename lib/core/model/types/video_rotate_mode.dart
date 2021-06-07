import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class VideoRotateMode {
  final String _name;

  const VideoRotateMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static VideoRotateMode parse(String str) {
    switch (str) {
      case "off":
        return VideoRotateMode.Off;
      case "on":
        return VideoRotateMode.On;
      case "auto":
        return VideoRotateMode.Auto;
      default:
        return Unknown;
    }
  }

  static const VideoRotateMode Unknown = VideoRotateMode._('Unknown');
  static const VideoRotateMode Off = VideoRotateMode._('off');
  static const VideoRotateMode On = VideoRotateMode._('on');
  static const VideoRotateMode Auto = VideoRotateMode._('auto');

  static const listItems = <VideoRotateMode>[Unknown, Off, On, Auto];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Video Rotate Mode'),
              trailing: DropdownButton<VideoRotateMode>(
                value: settings.videoRotateMode,
                items: VideoRotateMode.listItems
                    .map((VideoRotateMode value) =>
                        DropdownMenuItem<VideoRotateMode>(
                            value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (VideoRotateMode newValue) {
                  settings.videoRotateMode = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
