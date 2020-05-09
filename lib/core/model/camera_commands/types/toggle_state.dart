import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/types/enums.dart';
import 'package:provider/provider.dart';

class ToggleState {
  final String _name;

  const ToggleState._(this._name);

  @override
  String toString() {
    return _name;
  }

  static ToggleState parse(String str) {
    switch (str) {
      case "off":
        return ToggleState.Off;
      case "on":
        return ToggleState.On;
      default:
        return Unknown;
    }
  }

  static const ToggleState Unknown = ToggleState._('Unknown');
  static const ToggleState Off = ToggleState._('off');
  static const ToggleState On = ToggleState._('on');

  static Widget getWidget(ToggleStateSettings usage) => _Widget(usage);
}

class _Widget extends StatelessWidget {
  final ToggleStateSettings _usage;

  _Widget(this._usage);

  String _title(){
    switch(_usage){
      case ToggleStateSettings.electronicImageStabilization:
        return "Electronic Image Stabilization";
      case ToggleStateSettings.videoMute:
        return "Video Mute";
      case ToggleStateSettings.buzzerRing:
        return "Buzzer Ring";
      case ToggleStateSettings.adjustLensDistortion:
        return "Adjust Lens Distortion";
      default:
        return _usage.toString();
    }
  }

  bool _getValue(ActionCameraSettings settings){
    switch(_usage){
      case ToggleStateSettings.electronicImageStabilization:
        return settings.electronicImageStabilizationState == ToggleState.On;
      case ToggleStateSettings.videoMute:
        return settings.videoMuteState == ToggleState.On;
      case ToggleStateSettings.buzzerRing:
        return settings.buzzerRing == ToggleState.On;
      case ToggleStateSettings.adjustLensDistortion:
        return settings.adjustLensDistortionState == ToggleState.On;
      default:
        return false;
    }
  }

  void _setValue(ActionCameraSettings settings, bool value){
    switch(_usage){
      case ToggleStateSettings.electronicImageStabilization:
        settings.electronicImageStabilizationState = value ? ToggleState.On :  ToggleState.Off;
        break;
      case ToggleStateSettings.videoMute:
        settings.videoMuteState  = value ? ToggleState.On :  ToggleState.Off;
        break;
      case ToggleStateSettings.buzzerRing:
        settings.buzzerRing  = value ? ToggleState.On :  ToggleState.Off;
        break;
      case ToggleStateSettings.adjustLensDistortion:
        settings.adjustLensDistortionState  = value ? ToggleState.On :  ToggleState.Off;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ActionCameraSettings>(
        builder: (context, settings, widget) => SwitchListTile(
          title: Text(_title()),
            value: _getValue(settings),
            onChanged: (bool newValue) {
            _setValue(settings, newValue);
              settings.changed();
            },
          ),
        );
  }
}


