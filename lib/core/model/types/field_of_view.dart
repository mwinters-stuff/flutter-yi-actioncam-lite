import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:provider/provider.dart';

class FieldOfView {
  final String _name;

  const FieldOfView._(this._name);

  @override
  String toString() {
    return _name;
  }

  static FieldOfView parse(String str) {
    switch (str) {
      case 'wide':
        return Wide;
      case 'medium':
        return Medium;
      case 'narrow':
        return Narrow;
      default:
        return Unknown;
    }
  }

  static const FieldOfView Unknown = FieldOfView._('Unknown');
  static const FieldOfView Wide = FieldOfView._('wide');
  static const FieldOfView Medium = FieldOfView._('medium');
  static const FieldOfView Narrow = FieldOfView._('narrow');

  static const listItems = <FieldOfView>[
    Unknown,
    Wide, Medium, Narrow
  ];

  static Widget getWidget() => _Widget();
}



class _Widget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
            ListTile(title: Text('Video Field Of View'),
              trailing: DropdownButton<FieldOfView>(
                value: settings.videoFieldOfView,
                items: FieldOfView.listItems.map((FieldOfView value) => DropdownMenuItem<FieldOfView> (
                    value: value,
                    child: Text(value.toString())
                )).toList(),
                onChanged: (FieldOfView newValue){
                  settings.videoFieldOfView = newValue;
                  settings.changed();
                },
              ),
            ));
  }

}