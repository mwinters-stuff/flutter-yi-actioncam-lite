import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/bloc/bloc.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_bloc.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_event.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_state.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_file_list.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_settings.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';
import 'package:flutterYiActionCameraLite/core/utils/constants.dart';
import 'package:flutterYiActionCameraLite/ui/app_drawer.dart';
import 'package:flutterYiActionCameraLite/ui/base_screen.dart';
import 'package:flutterYiActionCameraLite/ui/base_page.dart';
import 'package:flutterYiActionCameraLite/ui/battery_icon.dart';
import 'package:flutterYiActionCameraLite/ui/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends BasePage {
  static const RouteName = '/';

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen> with BaseScreen {
  @override
  List<Widget> actions(BuildContext context) {
    return [
      BatteryIcon(),
//      IconButton(
//          icon: Icon(client.connected
//              ? Icons.lock_outline
//              : Icons.lock_open),
//          onPressed: () => _doConnectOrDisconnect(context, client)),
    ];
  }

  @override
  Widget body(BuildContext context) {
    return BlocBuilder<CameraServiceBloc, CameraServiceState>(
        builder: (context, cameraState) => Container(
            child: Center(
                child: (cameraState is! ConnectedState) && (cameraState is! DisconnectedState)
                    ? CircularProgressIndicator()
                    : RaisedButton(child: Text(_connectButtonText(cameraState)), onPressed: () => _doConnectOrDisconnect(cameraState)))));
  }

  void _doConnectOrDisconnect(CameraServiceState state) {
    if (state is ConnectedState) {
      BlocProvider.of<CameraServiceBloc>(context).add(Disconnect(context: context));
    } else if (state is DisconnectedState) {
      BlocProvider.of<CameraServiceBloc>(context).add(Connect(context: context));
    }
  }

  @override
  Widget bottomSheet(BuildContext context) {
    return BlocBuilder<StartSessionBloc, StartSessionState>(
        builder: (context, dataState) =>
            (dataState is StartSessionDataState) ? Text(dataState.rtspUrl, textAlign: TextAlign.center) : Container(width: 0.0, height: 0.0));
  }

  @override
  String screenName() {
    return 'Yi Action Camera';
  }

  String _connectButtonText(CameraServiceState state) {
    if (state is ConnectedState) {
      return 'Disconnect';
    } else if (state is DisconnectedState) {
      return 'Connect';
    }
    return 'Wait...';
  }
}
