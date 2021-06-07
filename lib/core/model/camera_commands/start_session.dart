import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';

class StartSession extends CameraCommand {
  static const int COMMAND_ID = 257;
  String rtspUrl;
  int sessionId;

  StartSession() : super(COMMAND_ID);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    sessionId = response.data['param'];
    if (response.data.containsKey("rtsp")) {
      rtspUrl = response.data["rtsp"];
    }
    assert(sessionId != null && rtspUrl != null);
    return null;
  }

  StartSession.data(this.rtspUrl, this.sessionId): super(COMMAND_ID);


}
