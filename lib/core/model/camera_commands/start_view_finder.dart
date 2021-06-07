import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';

class StartViewFinder extends CameraCommand {
  StartViewFinder() : super(259);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    if(response.data['rval'] != ErrorCode.Success){
      return YICameraSDKError(response.data['rval']);
    }
    return null;
  }
}
