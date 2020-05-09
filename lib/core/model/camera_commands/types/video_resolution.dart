import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class VideoResolution {
  final String _name;

  const VideoResolution._(this._name);

  @override
  String toString() {
    return _name;
  }

  static VideoResolution parse(String str) {
    switch (str) {
      case "3840x2160 30P 16:9": 
        return VideoResolution.v_3840x2160_30p_16x9;
      case "3840x2160 30P 16:9 super": 
        return VideoResolution.v_3840x2160_30p_16x9_super;
      case "2560x1920 30P 4:3": 
        return VideoResolution.v_2560x1920_30p_4x3;
      case "1920x1440 60P 4:3": 
        return VideoResolution.v_1920x1440_60p_4x3;
      case "1920x1440 30P 4:3": 
        return VideoResolution.v_1920x1440_30p_4x3;
      case "1920x1080 120P 16:9": 
        return VideoResolution.v_1920x1080_120p_16x9;
      case "1920x1080 120P 16:9 super": 
        return VideoResolution.v_1920x1080_120p_16x9_super;
      case "1920x1080 60P 16:9": 
        return VideoResolution.v_1920x1080_60p_16x9;
      case "1920x1080 60P 16:9 super": 
        return VideoResolution.v_1920x1080_60p_16x9_super;
      case "1920x1080 30P 16:9": 
        return VideoResolution.v_1920x1080_30p_16x9;
      case "1920x1080 25P 16:9":
        return VideoResolution.v_1920x1080_25p_16x9;
      case "1920x1080 30P 16:9 super":
        return VideoResolution.v_1920x1080_30p_16x9_super;
      case "1280x960 120P 4:3": 
        return VideoResolution.v_1280x960_120p_4x3;
      case "1280x960 60P 4:3": 
        return VideoResolution.v_1280x960_60p_4x3;
      case "1280x720 240P 16:9": 
        return VideoResolution.v_1280x720_240p_16x9;
      case "1280x720 120P 16:9 super": 
        return VideoResolution.v_1280x720_120p_16x9_super;
      case "1280x720 60P 16:9 super": 
        return VideoResolution.v_1280x720_60p_16x9_super;
      case "840x480 240P 16:9": 
        return VideoResolution.v_840x480_120p_16x9;
      default:
        print(str);
        return Unknown;
    }
  }

  static const VideoResolution Unknown = VideoResolution._('Unknown');
  static const VideoResolution v_3840x2160_30p_16x9 = VideoResolution._('3840x2160 30p 16:9');
  static const VideoResolution v_3840x2160_30p_16x9_super = VideoResolution._('3840x2160 30p 16:9 super');
  static const VideoResolution v_2560x1920_30p_4x3 = VideoResolution._('2560x1920 30p 4:3');
  static const VideoResolution v_1920x1440_60p_4x3 = VideoResolution._('1920x1440 60p 4:3');
  static const VideoResolution v_1920x1440_30p_4x3 = VideoResolution._('1920x1440 30p 4:3');
  static const VideoResolution v_1920x1080_120p_16x9 = VideoResolution._('1920x1080 120p 16:9');
  static const VideoResolution v_1920x1080_120p_16x9_super = VideoResolution._('1920x1080 120p 16:9 super');
  static const VideoResolution v_1920x1080_60p_16x9 = VideoResolution._('1920x1080 60p 16:9');
  static const VideoResolution v_1920x1080_25p_16x9 = VideoResolution._('1920x1080 25p 16:9');
  static const VideoResolution v_1920x1080_60p_16x9_super = VideoResolution._('1920x1080 60p 16:9 super');
  static const VideoResolution v_1920x1080_30p_16x9 = VideoResolution._('1920x1080 30p 16:9');
  static const VideoResolution v_1920x1080_30p_16x9_super = VideoResolution._('1920x1080 30p 16:9 super');
  static const VideoResolution v_1280x960_120p_4x3 = VideoResolution._('1280x960 120p 4:3');
  static const VideoResolution v_1280x960_60p_4x3 = VideoResolution._('1280x960 60p 4:3');
  static const VideoResolution v_1280x720_240p_16x9         = VideoResolution._('1280x720 240p 16:9');
  static const VideoResolution v_1280x720_120p_16x9_super   = VideoResolution._('1280x720 120p 16:9 super');
  static const VideoResolution v_1280x720_60p_16x9_super    = VideoResolution._('1280x720 60p 16:9 super');
  static const VideoResolution v_840x480_120p_16x9          = VideoResolution._('840x480 120p 16:9');


  static const listItems = <VideoResolution>[
    v_3840x2160_30p_16x9,
    v_3840x2160_30p_16x9_super,
    v_2560x1920_30p_4x3,
    v_1920x1440_60p_4x3,
    v_1920x1440_30p_4x3,
    v_1920x1080_120p_16x9,
    v_1920x1080_120p_16x9_super,
    v_1920x1080_60p_16x9,
    v_1920x1080_25p_16x9,
    v_1920x1080_60p_16x9_super,
    v_1920x1080_30p_16x9,
    v_1920x1080_30p_16x9_super,
    v_1280x960_120p_4x3,
    v_1280x960_60p_4x3,
    v_1280x720_240p_16x9,
    v_1280x720_120p_16x9_super,
    v_1280x720_60p_16x9_super,
    v_840x480_120p_16x9,
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
          title: Text('Video Resolution'),
          trailing: DropdownButton<VideoResolution>(
            value: settings.videoResolution,
            items: VideoResolution.listItems
                .map((VideoResolution value) => DropdownMenuItem<VideoResolution>(value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (VideoResolution newValue) {
              settings.videoResolution = newValue;
              settings.changed();
            },
          ),
        ));
  }
}
