import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:flutterYiActionCameraLite/core/model/types/types.dart';
import 'package:provider/provider.dart';

class Quality {
  final String _name;

  const Quality._(this._name);

  @override
  String toString() {
    return _name;
  }

  static Quality parse(String str) {
    switch (str) {
      case 'S.Fine':
        return High;
      case 'Fine':
        return Middle;
      case 'Normal':
        return Low;
      default:
        return Unknown;
    }
  }

  static const Quality Unknown = Quality._('Unknown');
  static const Quality High = Quality._('S.Fine');
  static const Quality Middle = Quality._('Fine');
  static const Quality Low = Quality._('Normal');

  static const listItems = <Quality>[
    Unknown,
    High,
    Middle,
    Low
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
              (_usage == VideoOrPhoto.video ? 'Video' : 'Photo') + ' Quality'),
          trailing: DropdownButton<Quality>(
            value: (_usage == VideoOrPhoto.video
                ? settings.videoQuality
                : settings.photoQuality),
            items: Quality.listItems
                .map((Quality value) => DropdownMenuItem<Quality>(
                value: value, child: Text(value.toString())))
                .toList(),
            onChanged: (Quality newValue) {
              switch (_usage) {
                case VideoOrPhoto.photo:
                  settings.photoQuality = newValue;
                  break;
                case VideoOrPhoto.video:
                  settings.videoQuality = newValue;
                  break;
              }
              settings.changed();
            },
          ),
        ));
  }
}

