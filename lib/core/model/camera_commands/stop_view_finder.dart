import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_command.dart';
import 'package:flutter_yi_actioncam_lite/core/model/others/camera_response.dart';
import 'package:flutter_yi_actioncam_lite/core/model/others/error_code.dart';
import 'package:flutter_yi_actioncam_lite/core/model/others/yi_camera_error.dart';

class StopViewFinder extends CameraCommand {
  StopViewFinder() : super(260);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    if (response.data['rval'] != ErrorCode.Success) {
      return YICameraSDKError(response.data['rval']);
    }
    return null;
  }
}
