import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/types/enums.dart';
import 'package:provider/provider.dart';

class Sharpness {
  final String _name;

  const Sharpness._(this._name);

  @override
  String toString() {
    return _name;
  }

  static Sharpness parse(String str) {
    switch (str) {
      case 'low':
        return Low;
      case 'medium':
        return Medium;
      case 'high':
        return High;

      default:
        return Unknown;
    }
  }

  static const Sharpness Unknown = Sharpness._('Unknown');
  static const Sharpness Low = Sharpness._('low');
  static const Sharpness Medium = Sharpness._('medium');
  static const Sharpness High = Sharpness._('high');

  static const listItems = <Sharpness>[
    Unknown,
    Low,
    Medium,
    High
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
              (_usage == VideoOrPhoto.video ? 'Video' : 'Photo') + ' Sharpness'),
          trailing: DropdownButton<Sharpness>(
            value: (_usage == VideoOrPhoto.video
                ? settings.videoSharpness
                : settings.photoSharpness),
            items: Sharpness.listItems
                .map((Sharpness value) => DropdownMenuItem<Sharpness>(
                value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (Sharpness newValue) {
              switch (_usage) {
                case VideoOrPhoto.photo:
                  settings.photoSharpness = newValue;
                  break;
                case VideoOrPhoto.video:
                  settings.videoSharpness = newValue;
                  break;
              }
              settings.changed();
            },
          ),
        ));
  }
}

