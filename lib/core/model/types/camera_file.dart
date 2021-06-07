import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/ui/image_preview_screen.dart';

class CameraFile {
  String _filename;
  int _fileSize;
  DateTime _dateTime;

  CameraFile(this._filename, this._fileSize, this._dateTime);

  @override
  String toString() {
    return "Filename: $_filename Size: $_fileSize DateTime: $_dateTime";
  }

  Widget getListWidget(BuildContext context) {
    return ListTile(
        title: Text(_filename),
        trailing: Text(_fileSize.toString()),
        subtitle: Text(_dateTime.toString()),
        onTap: () => Navigator.pushNamed(context, ImagePreviewScreen.RouteName, arguments: this));
  }

  String get filename => _filename;

  DateTime get dateTime => _dateTime;

  int get fileSize => _fileSize;

  String get url => 'http://192.168.42.1/DCIM/100MEDIA/$_filename';
}
