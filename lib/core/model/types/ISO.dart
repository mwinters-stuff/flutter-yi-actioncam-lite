import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/types/enums.dart';
import 'package:provider/provider.dart';

class ISO {
  final String _name;

  const ISO._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ISO parse(String str) {
    switch (str) {
      case 'auto':
        return iso_Auto;
      case '100':
        return iso_100;
      case '200':
        return iso_200;
      case '400':
        return iso_400;
      case '800':
        return iso_800;
      case '1600':
        return iso_1600;
      case '6400':
        return iso_6400;
      default:
        return Unknown;
    }
  }

  static const ISO Unknown = ISO._('Unknown');
  static const ISO iso_Auto = ISO._('auto');
  static const ISO iso_100 = ISO._('100');
  static const ISO iso_200 = ISO._('200');
  static const ISO iso_400 = ISO._('400');
  static const ISO iso_800 = ISO._('800');
  static const ISO iso_1600 = ISO._('1600');
  static const ISO iso_6400 = ISO._('6400');

  static const listItems = <ISO>[
    Unknown,
    iso_Auto,
    iso_100,
    iso_200,
    iso_400,
    iso_800,
    iso_1600,
    iso_6400
  ];

  static Widget getWidget(VideoOrPhoto usage) => _Widget(usage);
}

class _Widget extends StatelessWidget {
  final VideoOrPhoto _usage;

  _Widget(this._usage);

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) {
          var bad = (_usage == VideoOrPhoto.video
              ? settings.videoISO
              : settings.photoISO) == ISO.Unknown;
          return ListTile(
            title: Text(
                (_usage == VideoOrPhoto.video ? 'Video' : 'Photo') + ' ISO', style: bad ? TextStyle(color: Colors.red): null),
            trailing: DropdownButton<ISO>(
              value: (_usage == VideoOrPhoto.video
                  ? settings.videoISO
                  : settings.photoISO),
              items: ISO.listItems
                  .map((ISO value) => DropdownMenuItem<ISO>(
                  value: value, child: Text(value.toString())))
                  .toList(),
              onChanged: (ISO newValue) {
                switch (_usage) {
                  case VideoOrPhoto.photo:
                    settings.photoISO = newValue;
                    break;
                  case VideoOrPhoto.video:
                    settings.videoISO = newValue;
                    break;
                }
                settings.changed();
              },
            ),
          );
        });
  }
}
