import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/types/enums.dart';
import 'package:provider/provider.dart';

class WhiteBalance {
  final String _name;

  const WhiteBalance._(this._name);

  @override
  String toString() {
    return _name;
  }

  static WhiteBalance parse(String str) {
    switch (str) {
      case "auto":
        return WhiteBalance.Auto;
      case "native":
        return WhiteBalance.Native;
      case "3000k":
        return WhiteBalance.Tungsten;
      case "5500k":
        return WhiteBalance.Daylight;
      case "6500k":
        return WhiteBalance.Cloudy;
      default:
        return Unknown;
    }
  }

  static const WhiteBalance Unknown = WhiteBalance._('Unknown');
  static const WhiteBalance Auto = WhiteBalance._('auto');
  static const WhiteBalance Native = WhiteBalance._('native');
  static const WhiteBalance Tungsten = WhiteBalance._('3000k');
  static const WhiteBalance Daylight = WhiteBalance._('5500k');
  static const WhiteBalance Cloudy = WhiteBalance._('6500k');

  static const listItems = <WhiteBalance>[
    Auto,
    Native,
    Tungsten,
    Daylight,
    Cloudy
  ];


  static Widget getWidget(VideoOrPhoto usage) => _Widget(usage);
}

class _Widget extends StatelessWidget {
  final VideoOrPhoto _usage;

  _Widget(this._usage);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
          title: Text(
              (_usage == VideoOrPhoto.video ? 'Video' : 'Photo') + ' White Balance'),
          trailing: DropdownButton<WhiteBalance>(
            value: (_usage == VideoOrPhoto.video
                ? settings.videoWhiteBalance
                : settings.photoWhiteBalance),
            items: WhiteBalance.listItems
                .map((WhiteBalance value) => DropdownMenuItem<WhiteBalance>(
                value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (WhiteBalance newValue) {
              switch (_usage) {
                case VideoOrPhoto.photo:
                  settings.photoWhiteBalance = newValue;
                  break;
                case VideoOrPhoto.video:
                  settings.videoWhiteBalance = newValue;
                  break;
              }
              settings.changed();
            },
          ),
        ));
  }
}

