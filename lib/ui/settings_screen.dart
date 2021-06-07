import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:flutterYiActionCameraLite/ui/base_page.dart';
import 'package:flutterYiActionCameraLite/ui/base_screen.dart';
import 'package:flutterYiActionCameraLite/ui/base_widget.dart';
import 'package:flutterYiActionCameraLite/ui/battery_icon.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends BasePage{
  static const RouteName = '/settingsScreen';

  @override
  State<StatefulWidget> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends BaseState<SettingsScreen> with BaseScreen {

  @override
  Widget body(BuildContext context) {
    return BaseWidget<ActionCameraSettings>(
      model: Provider.of<ActionCameraSettings>(context),
      onModelReady: (model) => model.getSettings(context),
          builder: (context, model, _) => ListView.builder(
            itemCount: model.configWidgets.length,
            itemBuilder: (BuildContext context, int index) => model.configWidgets[index],
          ));
  }

  @override
  List<Widget> actions(BuildContext context) {
    return [BatteryIcon()];
  }
  @override
  String screenName() {
    return 'Yi Camera - Settings';
  }

}
