import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_command.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:flutterinfluxdb/core/model/camera_response.dart';
import 'package:flutterinfluxdb/core/model/error_code.dart';
import 'package:flutterinfluxdb/core/model/yi_camera_error.dart';
import 'package:flutterinfluxdb/core/services/camera_service.dart';
import 'package:provider/provider.dart';

class GetSettings extends CameraCommand {
  var _params = HashMap<String,String>();

  get params => _params;

  GetSettings() : super(3);

  @override
  YICameraSDKError onChildSuccess(BuildContext buildContext, CameraResponse response) {
    var p = response.data['param'];
    _params.clear();
    p.forEach((i) {
      _params[i.keys.first] = i.values.first;
    });
    Provider.of<ActionCameraSettings>(buildContext, listen: false).loadSettings(_params);
    notifyListeners();
    return null;
  }

  void changed() {
    notifyListeners();
  }

  void clear() {
    _params.clear();
    notifyListeners();
  }
}
