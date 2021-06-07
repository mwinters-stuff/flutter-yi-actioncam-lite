import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_command.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/battery_quantity.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/get_file_list.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/get_settings.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/start_session.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/start_view_finder.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/stop_view_finder.dart';
import 'package:flutter_yi_actioncam_lite/core/model/others/camera_response.dart';
import 'package:flutter_yi_actioncam_lite/core/services/camera_response_parser.dart';
import 'package:flutter_yi_actioncam_lite/core/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CameraService {
  Socket _socket;
  Timer _keepAliveTimer;
  int _heartBeat = 0;
  int _sessionId;
  String _rtspUrl = '';

//  StreamSubscription<CameraResponse> _streamSubscription;
//  StreamController<CameraResponse> _responseStreamController;

  String get rtsp => _rtspUrl;

  bool get connected => _socket != null;
  var _responseParser = CameraResponseParser();

  var _commands = HashMap<int, CameraCommand>();

  CameraService();

  Future<bool> connect(BuildContext context) async {
    _keepAliveTimer?.cancel();
    return Socket.connect(Constants.CAMERA_ADDRESS, Constants.CAMERA_PORT,
            timeout: Duration(seconds: 2))
        .then((value) {
      _socket = value;
      _socket.listen((data) => _handleData(context, data),
          onDone: () => _handleDone(context),
          onError: (error, trace) => _handleError(error, trace, context),
          cancelOnError: true);
      send(StartSession());
      return true;
    }).catchError((e) {
      print("catchConnectError ${e.message}");
      return false;
    });
  }

  void _handleData(BuildContext context, Uint8List data) {
    String received = new String.fromCharCodes(data).trim();
    print("Received $received");
    _responseParser.parse(received, (cameraResponse) {
      if (cameraResponse.valid) {
        if (cameraResponse.isNotification) {
          if (cameraResponse.messageId == 1793) {
            _sessionId = cameraResponse.data['token'];
          } else {
            _internalProcessNotification(context, cameraResponse);
          }
        } else {
          _handleResponse(context, cameraResponse);
        }
      }
    });
  }

  void _handleDone(BuildContext context) {
    print("done");

    _keepAliveTimer?.cancel();
    _heartBeat = 0;
    _socket = null;

//    BlocProvider.of<CameraServiceBloc>(context).add(Disconnect(context: context));
  }

  void _handleError(error, StackTrace trace, context) {
    print("_handleError $error");
    _keepAliveTimer?.cancel();
    BlocProvider.of<CameraServiceBloc>(context)
        .add(Disconnect(context: context));
  }

  void send(CameraCommand cameraCommand) {
    _commands[cameraCommand.commandId] = cameraCommand;
    sendData(cameraCommand.getData());
  }

  void sendData(Map<String, dynamic> data) {
    if (!data.containsKey('token')) {
      data['token'] = _sessionId;
    }
    String js = json.encode(data);
    print("Sending $js");
    _socket?.writeln(js);
  }

  void disconnect() {
    _keepAliveTimer?.cancel();
    _keepAliveTimer = null;
    _socket?.close();
  }

  void _internalProcessNotification(
      BuildContext context, CameraResponse cameraResponse) {
    if (cameraResponse.messageId != 7) {
      return;
    }
    print("Camera Notification ${cameraResponse.notificationType}");
    switch (cameraResponse.notificationType) {
      case 'battery':
        BlocProvider.of<BatteryQuantityBloc>(context).add(BatteryPercentEvent(
            percent: int.parse(cameraResponse.data['param'])));
        break;
      case 'adapter_status':
        BlocProvider.of<BatteryQuantityBloc>(context).add(
            BatteryAdapterEvent(adapter: cameraResponse.data['param'] == '1'));
        break;
      case "start_video_record":
        {
//          this.mListener.onRecordStarted();
          break;
        }
      case "video_record_complete":
        {
//          this.mListener.onRecordStopped();
          break;
        }
      case "start_photo_capture":
        {
//          this.mListener.onCaptureStarted();
          break;
        }
      case "photo_taken":
        {
//          this.mListener.onCaptureStopped();
          break;
        }
      case "vf_start":
        {
//          this.mListener.onViewFinderStarted();
          break;
        }
      case "vf_stop":
        {
//          this.mListener.onViewFinderStopped();
          break;
        }
      case "battery":
        {
//          this.mListener.onBatteryLifeChanged(Integer.parseInt(response.getString("param")));
          break;
        }
      case "sdcard_format_done":
        {
//          this.mListener.onSDCardFormatted();
          break;
        }
      case "setting_changed":
        {
//          final ActionCameraSettings newSettings = ActionCameraSettings.parseSettingValue(response.getString("param"), response.getString("value"));
//          if (newSettings != null) {
//            this.mListener.onSettingChanged(newSettings);
          break;
        }
        break;
    }
  }

  void getSettings(BuildContext buildContext) {
    print("getSettings");
    send(GetSettings());
  }

  void _handleResponse(BuildContext context, CameraResponse response) {
    if (_commands.containsKey(response.messageId)) {
      var cameraCommand = _commands[response.messageId];
      _commands.remove(response.messageId);
      print("handle message received  ${cameraCommand.commandId}");
      _keepAliveTimer?.cancel();
      cameraCommand.onSuccess(response).then((ok) {
        _keepAliveTimer = Timer.periodic(Duration(seconds: 5), (timer) {
          sendData({'token': _sessionId, 'heartbeat': ++_heartBeat});
        });
        if (ok) {
          if (cameraCommand is StartSession) {
            BlocProvider.of<StartSessionBloc>(context).add(
                StartSessionDataEvent(
                    sessionId: cameraCommand.sessionId,
                    rtspUrl: cameraCommand.rtspUrl));
            _sessionId = cameraCommand.sessionId;
            send(BatteryQuantity());
          }
          if (cameraCommand is BatteryQuantity) {
            BlocProvider.of<BatteryQuantityBloc>(context).add(
                BatteryPercentAdapterEvent(
                    percent: cameraCommand.batteryQuantity,
                    adapter: cameraCommand.adapterStatus));
          }
        }
      });
    }
  }

  void startViewFinder(BuildContext context) {
    print("startViewFinder");
    send(StartViewFinder());
  }

  void stopViewFinder(BuildContext context) {
    print("startViewFinder");
    send(StopViewFinder());
  }

  void getFileList(BuildContext context) {
    print("getFileList");
    send(GetFileList());
  }
}
