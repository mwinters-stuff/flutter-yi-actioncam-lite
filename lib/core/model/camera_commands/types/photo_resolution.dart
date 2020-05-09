import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class PhotoResolution {
  final String _name;

  const PhotoResolution._(this._name);

  @override
  String toString() {
    return _name;
  }

  static PhotoResolution parse(String str) {
    switch (str) {
      case '16M (4608x3456 4:3)':
        return p_16MP_4608x3456_4x3;
      case '12MP (4000x3000 4:3) fov:w':
        return p_12MP_4000x3000_4x3_w;
      case '7MP (3008x2256 4:3) fov:w':
        return p_7MP_3008x2256_4x3_w;
      case '7MP (3008x2256 4:3) fov:m':
        return p_7MP_3008x2256_4x3_m;
      case '5MP (2560x1920 4:3) fov:m':
        return p_5MP_2560x1920_4x3_m;
      case '8MP (3840x2160 16:9) fov:w':
        return p_8MP_3840x2160_16x9_w;
      default:
        return Unknown;
    }
  }

  static const PhotoResolution Unknown = PhotoResolution._('Unknown');
  static const PhotoResolution p_16MP_4608x3456_4x3 =
      PhotoResolution._('16M (4608x3456 4:3)');
  static const PhotoResolution p_12MP_4000x3000_4x3_w =
      PhotoResolution._('12MP (4000x3000 4:3) fov:w');
  static const PhotoResolution p_7MP_3008x2256_4x3_w =
      PhotoResolution._('7MP (3008x2256 4:3) fov:w');
  static const PhotoResolution p_7MP_3008x2256_4x3_m =
      PhotoResolution._('7MP (3008x2256 4:3) fov:m');
  static const PhotoResolution p_5MP_2560x1920_4x3_m =
      PhotoResolution._('5MP (2560x1920 4:3) fov:m');
  static const PhotoResolution p_8MP_3840x2160_16x9_w =
      PhotoResolution._('8MP (3840x2160 16:9) fov:w');

  static const listItems = <PhotoResolution>[
    Unknown,
    p_16MP_4608x3456_4x3,
    p_12MP_4000x3000_4x3_w,
    p_7MP_3008x2256_4x3_w,
    p_7MP_3008x2256_4x3_m,
    p_5MP_2560x1920_4x3_m,
    p_8MP_3840x2160_16x9_w
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => ListTile(
              title: Text('Photo Resolution'),
              trailing: DropdownButton<PhotoResolution>(
                value: settings.photoResolution,
                items: PhotoResolution.listItems
                    .map((PhotoResolution value) =>
                        DropdownMenuItem<PhotoResolution>(
                            value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (PhotoResolution newValue) {
                  settings.photoResolution = newValue;
                  settings.changed();
                },
              ),
            ));
  }
}
