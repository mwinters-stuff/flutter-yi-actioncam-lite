import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/yi_camera_error.dart';

class GetBatteryQuantity extends CameraCommand {
  int _batteryQuantity;

  bool _adapterStatus = false;

  bool get adapterStatus => _adapterStatus;

  set adapterStatus(bool value) {
    _adapterStatus = value;
    notifyListeners();
  }

  int get batteryQuantity => _batteryQuantity;

  set batteryQuantity(int value) {
    _batteryQuantity = value;
    notifyListeners();
  }

  GetBatteryQuantity() : super(13);

  @override
  YICameraSDKError onChildSuccess(BuildContext buildContext, CameraResponse response) {
    if (response.data['type'] != 'battery' && response.data['type'] != 'adapter') {
      return new YICameraSDKError(ErrorCode.InvalidResponse);
    }
    _adapterStatus = response.data['type'] == 'adapter';
    batteryQuantity = response.data['param'];

    print("GetBatteryQuantity: $_batteryQuantity");
    return null;
  }
}
