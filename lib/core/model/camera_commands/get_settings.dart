import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_command.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';
import 'package:provider/provider.dart';

class GetSettings extends CameraCommand {
  var _params = HashMap<String,String>();

  get params => _params;

  GetSettings() : super(3);

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    var p = response.data['param'];
    _params.clear();
    p.forEach((i) {
      _params[i.keys.first] = i.values.first;
    });
//    Provider.of<ActionCameraSettings>(buildContext, listen: false).loadSettings(_params);
    return null;
  }

  void changed() {
  }

  void clear() {
    _params.clear();
  }
}
