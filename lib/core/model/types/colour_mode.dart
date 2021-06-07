import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:flutter_yi_actioncam_lite/core/model/types/types.dart';

import 'package:provider/provider.dart';

class ColourMode {
  final String _name;

  const ColourMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ColourMode parse(String str) {
    switch (str) {
      case 'yi':
        return YIColor;
      case 'flat':
        return Flat;
      default:
        return Unknown;
    }
  }

  static const ColourMode Unknown = ColourMode._('Unknown');
  static const ColourMode YIColor = ColourMode._('yi');
  static const ColourMode Flat = ColourMode._('flat');

  static const listItems = <ColourMode>[Unknown, YIColor, Flat];

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
                  ' Colour Mode'),
              trailing: DropdownButton<ColourMode>(
                value: (_usage == VideoOrPhoto.video
                    ? settings.videoColorMode
                    : settings.photoColorMode),
                items: ColourMode.listItems
                    .map((ColourMode value) => DropdownMenuItem<ColourMode>(
                        value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (ColourMode newValue) {
                  switch (_usage) {
                    case VideoOrPhoto.photo:
                      settings.photoColorMode = newValue;
                      break;
                    case VideoOrPhoto.video:
                      settings.videoColorMode = newValue;
                      break;
                  }
                  settings.changed();
                },
              ),
            ));
  }
}
