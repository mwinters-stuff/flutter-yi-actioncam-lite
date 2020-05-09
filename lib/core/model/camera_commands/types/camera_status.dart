import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:provider/provider.dart';

class CameraStatus {
  final String _name;

  const CameraStatus._(this._name);

  @override
  String toString() {
    return _name;
  }

  static CameraStatus parse(String str) {
    switch (str) {
      case 'idle':
        return Idle;
      case 'record':
        return Recording;
      case 'vf':
        return ViewFinderStarted;
      default:
        return Unknown;
    }
  }

  static const CameraStatus Unknown = CameraStatus._('Unknown');
  static const CameraStatus Idle = CameraStatus._('idle');
  static const CameraStatus Recording = CameraStatus._('record');
  static const CameraStatus ViewFinderStarted = CameraStatus._('vf');

  static Widget getWidget() => _Widget();
}

class _Widget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
      builder: (context, settings, widget) => ListTile(
        title: Text('Camera Status'),
        trailing: Text(settings.status.toString()),
      ),
    );
  }
}
