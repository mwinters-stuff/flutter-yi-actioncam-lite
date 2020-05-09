import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/yi_camera_error.dart';

class StartViewFinder extends CameraCommand {
  StartViewFinder() : super(259);

  @override
  YICameraSDKError onChildSuccess(BuildContext buildContext, CameraResponse response) {
    if(response.data['rval'] != ErrorCode.Success){
      return YICameraSDKError(response.data['rval']);
    }
    return null;
  }
}
