import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_file_list.dart';
import 'package:flutterYiActionCameraLite/ui/base_page.dart';
import 'package:flutterYiActionCameraLite/ui/base_screen.dart';
import 'package:flutterYiActionCameraLite/ui/base_widget.dart';
import 'package:flutterYiActionCameraLite/ui/battery_icon.dart';
import 'package:provider/provider.dart';

class FilesScreen extends BasePage{
  static const RouteName = '/filesScreen';

  @override
  State<StatefulWidget> createState() => _FilesScreenState();

}


class _FilesScreenState extends BaseState<FilesScreen> with BaseScreen {

  @override
  Widget body(BuildContext context) {
    return Text('bob');
    // BaseWidget<GetFileList>(
//        model: Provider.of<GetFileList>(context),
//        onModelReady: (model) => model.getFiles(context),
//        builder: (context, model, _) => ListView.builder(
//            itemCount: model.files.length,
//            itemBuilder: (BuildContext context, int index) => model.files[index].getListWidget(context)
//            ));
  }

  @override
  List<Widget> actions(BuildContext context) {
    // TODO: implement actions
    return [
      BatteryIcon(),
    ];
  }


  @override
  String screenName() {
    return 'Yi Camera - Files';
  }
}
