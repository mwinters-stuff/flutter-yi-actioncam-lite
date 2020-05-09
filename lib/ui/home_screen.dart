import 'package:flutter/material.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/camera_settings.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/get_battery_quantity.dart';
import 'package:flutterinfluxdb/core/model/camera_commands/get_settings.dart';
import 'package:flutterinfluxdb/core/services/camera_service.dart';
import 'package:flutterinfluxdb/ui/battery_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraService>(
        builder: (context, client, widget) => Scaffold(
              appBar: AppBar(title: Text('Yi Camera'), actions: <Widget>[
                IconButton(
                    icon: Icon(MdiIcons.cameraSwitch),
                    onPressed: () => client.startViewFinder(context)),
                IconButton(
                    icon: Icon(MdiIcons.cameraSwitchOutline),
                    onPressed: () => client.stopViewFinder(context)),
                BatteryIcon(),
                IconButton(
                    icon: Icon(client.connected
                        ? Icons.lock_outline
                        : Icons.lock_open),
                    onPressed: () => _doConnectOrDisconnect(context, client)),
              ]),
              backgroundColor: Colors.white,
              body: Consumer<ActionCameraSettings>(
                  builder: (context, settings, widget) => ListView.builder(
                        itemCount: settings.configWidgets.length,
                        itemBuilder: (BuildContext context, int index) =>
                            settings.configWidgets[index],
                      )),
            ));
  }

  void _doConnectOrDisconnect(
      BuildContext context, CameraService cameraService) {
    if (cameraService.connected) {
      cameraService.disconnect();
      Provider.of<GetSettings>(context, listen: false).clear();
      Provider.of<ActionCameraSettings>(context, listen: false).clear();
    } else {
      cameraService.connect(context);
    }
    // Provider.of<CameraService>(context, listen: false).connect();

    // Navigator.of(context).pushNamedAndRemoveUntil(Constants.loginScreenRouteName, (_) => false);
  }
}
