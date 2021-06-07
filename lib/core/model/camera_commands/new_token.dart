import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';

class NewToken extends CameraCommand {
  int _sessionId;

  int get sessionId => _sessionId;

  NewToken() : super(1793);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    _sessionId = response.data['token'];
    return null;
  }
}
