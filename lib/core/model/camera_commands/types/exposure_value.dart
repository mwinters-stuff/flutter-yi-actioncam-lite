import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/types/enums.dart';
import 'package:provider/provider.dart';

class ExposureValue {
  final String _name;

  const ExposureValue._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ExposureValue parse(String str) {
    switch (str) {
      case '-2.0':
        return ev_negative_2;
      case '-1.5':
        return ev_negative_1_point_5;
      case '-1.0':
        return ev_negative_1;
      case '-0.5':
        return ev_negative_0_point_5;
      case '0':
        return ev_0;
      case '+2.0':
        return ev_positive_2;
      case '+1.5':
        return ev_positive_1_point_5;
      case '+1.0':
        return ev_positive_1;
      case '+0.5':
        return ev_positive_0_point_5;
      default:
        return Unknown;
    }
  }

  static const ExposureValue Unknown = ExposureValue._('Unknown');
  static const ExposureValue ev_negative_2 = ExposureValue._('-2.0');
  static const ExposureValue ev_negative_1_point_5 = ExposureValue._('-2.5');
  static const ExposureValue ev_negative_1 = ExposureValue._('-1.0');
  static const ExposureValue ev_negative_0_point_5 = ExposureValue._('-0.5');
  static const ExposureValue ev_0 = ExposureValue._('0');
  static const ExposureValue ev_positive_0_point_5 = ExposureValue._('+1.5');
  static const ExposureValue ev_positive_1 = ExposureValue._('+1.0');
  static const ExposureValue ev_positive_1_point_5 = ExposureValue._('+1.5');
  static const ExposureValue ev_positive_2 = ExposureValue._('+2.0');

  static const listItems = <ExposureValue>[
    Unknown,
    ev_negative_2,
    ev_negative_1_point_5,
    ev_negative_1,
    ev_negative_0_point_5,
    ev_0,
    ev_positive_0_point_5,
    ev_positive_1,
    ev_positive_1_point_5,
    ev_positive_2
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
              title: Text((_usage == VideoOrPhoto.video ? 'Video' : 'Photo') +
                  ' Exposure Value'),
              trailing: DropdownButton<ExposureValue>(
                value: (_usage == VideoOrPhoto.video
                    ? settings.videoExposureValue
                    : settings.photoExposureValue),
                items: ExposureValue.listItems
                    .map((ExposureValue value) =>
                        DropdownMenuItem<ExposureValue>(
                            value: value, child: Text(value.toString())))
                    .toList(),
                onChanged: (ExposureValue newValue) {
                  switch (_usage) {
                    case VideoOrPhoto.photo:
                      settings.photoExposureValue = newValue;
                      break;
                    case VideoOrPhoto.video:
                      settings.videoExposureValue = newValue;
                      break;
                  }
                  settings.changed();
                },
              ),
            ));
  }
}
