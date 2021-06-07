import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/types/types.dart';
import 'package:flutterYiActionCameraLite/ui/battery_icon.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePreviewScreen extends StatelessWidget {
  static const RouteName = '/imagePreviewScreen';
  final CameraFile _file;

  ImagePreviewScreen(this._file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Yi Camera - ${_file.filename}'), actions: <Widget>[
          BatteryIcon(),
        ]),
        backgroundColor: Colors.white,
    body: Stack(
      children: [
        Center(child: CircularProgressIndicator()),
        Center(
            child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: _file.url
            )
        )
      ],
    ));
  }
}
