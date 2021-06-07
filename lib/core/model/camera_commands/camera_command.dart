import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/others/camera_response.dart';
import 'package:flutterYiActionCameraLite/core/model/others/error_code.dart';
import 'package:flutterYiActionCameraLite/core/model/others/yi_camera_error.dart';

abstract class CameraCommand{
  final int _commandId;

  int get commandId => _commandId;
  Function(CameraCommand) _success;
  Function(CameraCommand, YICameraSDKError) _fail;

  CameraCommand(this._commandId);

  void update({Function(CameraCommand) success, Function(CameraCommand, YICameraSDKError) fail}){
    _success = success;
    _fail = fail;
  }

  Map<String, dynamic> getData() {
    var obj = Map<String, dynamic>();
    obj['msg_id'] = _commandId;
    return obj;
  }

  YICameraSDKError onChildSuccess(final CameraResponse response);

  Future<bool> onSuccess(final CameraResponse response) async {
    YICameraSDKError error;
    bool result = true;
    final int rval = response.data['rval'];
    if (rval != 0) {
      error = YICameraSDKError(ErrorCode.CommandFailed, subError: YICameraSDKError(rval, subError: YICameraSDKError(ErrorCode.convertFirmwareError(rval))));
      result = false;
    } else {
      error = onChildSuccess(response);
    }
    if (error != null) {
      if(_fail != null) {
        _fail(this, error);
      }
      result = false;
    }
    if(_success != null) {
      _success(this);
    }
    return result;
  }

}
