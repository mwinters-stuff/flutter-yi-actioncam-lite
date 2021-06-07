import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class VideoStandard {
  final String _name;

  const VideoStandard._(this._name);

  @override
  String toString() {
    return _name;
  }

  static VideoStandard parse(String str) {
    switch (str) {
      case "PAL":
        return VideoStandard.PAL;
      case "NTSC":
        return VideoStandard.NTSC;
      default:
        return Unknown;
    }
  }

  static const VideoStandard Unknown = VideoStandard._('Unknown');
  static const VideoStandard PAL = VideoStandard._('PAL');
  static const VideoStandard NTSC = VideoStandard._('NTSC');

  static const listItems = <VideoStandard>[Unknown, PAL, NTSC];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Video Standard'),
              trailing: DropdownButton<VideoStandard>(
                value: settings.videoStandard,
                items: VideoStandard.listItems
                    .map((VideoStandard value) =>
                        DropdownMenuItem<VideoStandard>(
                            value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (VideoStandard newValue) {
                  settings.videoStandard = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
