import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_command.dart';
import 'package:flutterinfluxdb/core/model/camera_response.dart';
import 'package:flutterinfluxdb/core/model/yi_camera_error.dart';

class StartSession extends CameraCommand {
  String _rtspUrl;

  int _sessionId;

  int get sessionId => _sessionId;

  String get rtspUrl => _rtspUrl;

  StartSession() : super(257);

  @override
  YICameraSDKError onChildSuccess(BuildContext buildContext,CameraResponse response) {
    _sessionId = response.data['param'];
    if (response.data.containsKey("rtsp")) {
      _rtspUrl = response.data["rtsp"];
    }
    notifyListeners();
    return null;
  }
}
