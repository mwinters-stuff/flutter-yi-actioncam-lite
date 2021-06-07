import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_commands.dart';
import 'package:flutterYiActionCameraLite/core/model/others/others.dart';
import 'package:flutterYiActionCameraLite/core/model/types/types.dart';
import 'package:flutterYiActionCameraLite/core/services/services.dart';
import 'package:provider/provider.dart';

class GetFileList extends CameraCommand {
  List _files = List<CameraFile>();

  List get files => _files;

  bool _adapterStatus = false;

  bool get adapterStatus => _adapterStatus;

  set adapterStatus(bool value) {
    _adapterStatus = value;
  }


  GetFileList() : super(1282);

  @override
  Map<String, dynamic> getData() {
    var obj = super.getData();
    obj['param'] = '/tmp/fuse_d/DCIM/100MEDIA';
    return obj;
  }

  var fileSizeAndTimePattern = RegExp(r"^(\d+) byte\|(\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d)$");

  @override
  YICameraSDKError onChildSuccess(CameraResponse response) {
    print(response.data);
    _files.clear();
    var array = response.data['listing'];
    array.forEach((i) {
      var filename = i.keys.first;
       Iterable<RegExpMatch> matches =  fileSizeAndTimePattern.allMatches(i.values.first);
        matches.forEach((element) {
          var size = element.group(1);
          var time = element.group(2);
          CameraFile cameraFile = CameraFile(filename, int.parse(size), DateTime.parse(time));
          print(cameraFile.toString());
          files.add(cameraFile);
        });
    });
    return null;
  }

  getFiles(BuildContext context) {
    Provider.of<CameraService>(context, listen: false).getFileList(context);
  }
}
