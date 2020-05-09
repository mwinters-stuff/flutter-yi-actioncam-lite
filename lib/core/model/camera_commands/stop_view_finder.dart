import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/yi_camera_error.dart';

class StopViewFinder extends CameraCommand {
  StopViewFinder() : super(260);

  @override
  YICameraSDKError onChildSuccess(BuildContext buildContext, CameraResponse response) {
    if(response.data['rval'] != ErrorCode.Success){
      return YICameraSDKError(response.data['rval']);
    }
    return null;
  }
}
