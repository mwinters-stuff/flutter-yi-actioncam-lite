import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_response.dart';
import 'package:flutterinfluxdb/core/model/error_code.dart';
import 'package:flutterinfluxdb/core/model/yi_camera_error.dart';

abstract class CameraCommand extends ChangeNotifier{
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

  YICameraSDKError onChildSuccess(final BuildContext context, final CameraResponse response);

  void onSuccess(final BuildContext context, final CameraResponse response) async {
    YICameraSDKError error;
    final int rval = response.data['rval'];
    if (rval != 0) {
      error = YICameraSDKError(ErrorCode.CommandFailed, subError: YICameraSDKError(rval, subError: YICameraSDKError(ErrorCode.convertFirmwareError(rval))));
    } else {
      error = onChildSuccess(context, response);
    }
    if (error != null) {
      if(_fail != null) {
        _fail(this, error);
      }
    }
    if(_success != null) {
      _success(this);
    }
  }

}
