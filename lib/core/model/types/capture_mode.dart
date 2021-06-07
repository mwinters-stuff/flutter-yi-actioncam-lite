import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class CaptureMode {
  final String _name;

  const CaptureMode._(this._name);

  @override
  String toString() {
    return _name;
  }

  static CaptureMode parse(String str) {
    switch (str) {
      case 'precise quality':
        return Normal;
      case 'precise quality cont.':
        return Timelapse;
      default:
        return Unknown;
    }
  }


  static const CaptureMode Unknown = CaptureMode._('Unknown');
  static const CaptureMode Normal = CaptureMode._('precise quality');
  static const CaptureMode Timelapse = CaptureMode._('precise quality cont.');

  static const listItems = <CaptureMode>[
    Unknown,
    Normal, Timelapse
  ];

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) =>
            ListTile(title: Text('Capture Mode'),
              trailing: DropdownButton<CaptureMode>(
                value: settings.captureMode,
                items: CaptureMode.listItems.map((CaptureMode value) => DropdownMenuItem<CaptureMode> (
                    value: value,
                    child: Text(value.toString())
                )).toList(),
                onChanged: (CaptureMode newValue){
                  settings.captureMode = newValue;
                  settings.changed();
                },
              ),
            ));
  }

}