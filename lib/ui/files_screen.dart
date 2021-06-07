import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_settings.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';
import 'package:flutterYiActionCameraLite/ui/battery_icon.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CameraService>(
        builder: (context, client, widget) => Scaffold(
          appBar: AppBar(title: Text('Yi Camera'), actions: <Widget>[
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
}
