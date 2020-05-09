import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_command.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/get_battery_quantity.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/get_settings.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/start_session.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/start_view_finder.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/stop_view_finder.dart';
import 'package:flutterinfluxdb/core/model/camera_response.dart';
import 'package:flutterinfluxdb/core/services/camera_response_parser.dart';
import 'package:provider/provider.dart';

class CameraService extends ChangeNotifier {
  Socket _socket;
  Timer _keepAliveTimer;
  int _heartBeat = 0;
  int _sessionId;
  String _rtspUrl = '';

  StreamSubscription<CameraResponse> _streamSubscription;
  StreamController<CameraResponse> _responseStreamController;

  String get rtsp => _rtspUrl;

  bool get connected => _socket != null;
  var _responseParser = CameraResponseParser();

  var _commands = HashMap<int, CameraCommand>();

  CameraService();


  void connect(BuildContext buildContext) {
    Socket.connect('192.168.42.1', 7878).then((socket) {
      _responseStreamController =  StreamController<CameraResponse>();
      _streamSubscription = _responseStreamController.stream.listen((event) => _handleResponse(buildContext, event));
      _socket = socket;
      _socket.listen((data) => _handleData(data, buildContext),
          onDone: _handleDone, onError: _handleError, cancelOnError: false);

      var startSession = Provider.of<StartSession>(buildContext, listen: false);
      startSession.update(success: (cameraCommand) {
        _sessionId = (cameraCommand as StartSession).sessionId;
        _rtspUrl = (cameraCommand as StartSession).rtspUrl;
        notifyListeners();
        _getBatteryQuantity(buildContext);
        _getSettings(buildContext);
      }, fail: (cameraCommand, error) {
        print("StartSession Failed $error.code $error.detail");
        _streamSubscription?.cancel();
        _streamSubscription = null;
        _responseStreamController?.close();
        _responseStreamController = null;
        _socket.close();
        _socket = null;
        notifyListeners();
      });
      send(startSession);
      notifyListeners();
    }).catchError((error) {
      print('connect error $error');
      _streamSubscription?.cancel();
      _streamSubscription = null;
      _responseStreamController?.close();
      _responseStreamController = null;
      _socket = null;
      notifyListeners();
    });
  }

  void _handleData(Uint8List data, BuildContext context) {
    String received = new String.fromCharCodes(data).trim();
//    print(received);
    _responseParser.parse(received, (cameraResponse) {
      if (cameraResponse.isNotification) {
        _internalProcessNotification(context, cameraResponse);
      } else {
        _responseStreamController.sink.add(cameraResponse);
      }
    });
  }

  void _handleDone() {
    print("done");
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _responseStreamController?.close();
    _responseStreamController = null;

    _keepAliveTimer?.cancel();
    _heartBeat = 0;
    _socket = null;

    notifyListeners();
  }

  void _handleError(error, StackTrace trace) {}

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
    _socket?.close();
  }

  void _internalProcessNotification(BuildContext context,
      CameraResponse cameraResponse) {
    if (cameraResponse.messageId != 7) {
      return;
    }
    print("Camera Notification $cameraResponse.notificationType");
    switch (cameraResponse.notificationType) {
      case 'battery':
        Provider
            .of<GetBatteryQuantity>(context, listen: false)
            ?.batteryQuantity = int.parse(cameraResponse.data['param']);
        break;
      case 'adapter_status':
        Provider
            .of<GetBatteryQuantity>(context, listen: false)
            ?.adapterStatus = cameraResponse.data['param'] == '1';
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

  void _getBatteryQuantity(BuildContext buildContext) {
    print("getBatteryquantity");
    send(Provider.of<GetBatteryQuantity>(buildContext, listen: false));
  }

  void _getSettings(BuildContext buildContext) {
    print("getSettings");
    send(Provider.of<GetSettings>(buildContext, listen: false));
  }

  void _handleResponse(BuildContext context, CameraResponse response) {
    if (_commands.containsKey(response.messageId)) {
      var cameraCommand = _commands[response.messageId];
      _commands.remove(response.messageId);
      print("handle message received  ${cameraCommand.commandId}");
      _keepAliveTimer?.cancel();
      cameraCommand.onSuccess(context, response);
      _keepAliveTimer = Timer.periodic(Duration(seconds: 5), (timer)
      {
        sendData({'token': _sessionId, 'heartbeat': ++_heartBeat});
      });
    }
  }

  void startViewFinder(BuildContext context){
    print("startViewFinder");
    send(Provider.of<StartViewFinder>(context, listen: false));
  }

  void stopViewFinder(BuildContext context){
    print("startViewFinder");
    send(Provider.of<StopViewFinder>(context, listen: false));
  }

}
