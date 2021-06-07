import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/yi_camera_error.dart';

class StartSession extends CameraCommand {
  String _rtspUrl;

  int _sessionId;

  int get sessionId => _sessionId;

  String get rtspUrl => _rtspUrl;

  StartSession() : super(257);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    _sessionId = response.data['param'];
    if (response.data.containsKey("rtsp")) {
      _rtspUrl = response.data["rtsp"];
    }
    return null;
  }
}
