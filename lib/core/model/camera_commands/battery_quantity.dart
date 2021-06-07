import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/yi_camera_error.dart';

class GetBatteryQuantity extends CameraCommand {
  static const int COMMAND_ID = 13;
  int batteryQuantity;
  bool adapterStatus = false;

  GetBatteryQuantity() : super(COMMAND_ID);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    if (response.data['type'] != 'battery' && response.data['type'] != 'adapter') {
      return new YICameraSDKError(ErrorCode.InvalidResponse);
    }
    adapterStatus = response.data['type'] == 'adapter';
    batteryQuantity = response.data['param'];

    print("GetBatteryQuantity: $batteryQuantity $adapterStatus");
    return null;
  }

  GetBatteryQuantity.values(this.batteryQuantity, this.adapterStatus) : super(COMMAND_ID);
}
