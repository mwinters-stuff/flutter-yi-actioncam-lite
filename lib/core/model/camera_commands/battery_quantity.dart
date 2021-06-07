import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';

class BatteryQuantity extends CameraCommand {
  static const int COMMAND_ID = 13;
  int batteryQuantity;
  bool adapterStatus = false;

  BatteryQuantity() : super(COMMAND_ID);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    if (response.data['type'] != 'battery' && response.data['type'] != 'adapter') {
      return new YICameraSDKError(ErrorCode.InvalidResponse);
    }
    adapterStatus = response.data['type'] == 'adapter';
    batteryQuantity = response.data['param'];

    print("BatteryQuantity: $batteryQuantity $adapterStatus");
    return null;
  }

  BatteryQuantity.values(this.batteryQuantity, this.adapterStatus) : super(COMMAND_ID);
}
