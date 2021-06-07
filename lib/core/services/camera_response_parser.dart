import 'package:flutter_yi_actioncam_lite/core/model/others/camera_response.dart';

class CameraResponseParser {
  String _string = '';

  CameraResponseParser();

  void parse(
      String data, void Function(CameraResponse cameraResponse) callback) {
    _string += data;
    while (_string.isNotEmpty) {
      if (!_parseString(callback)) {
        break;
      }
    }
  }

  bool _parseString(void Function(CameraResponse cameraResponse) callback) {
    if (_string[0] != '{') {
      _string = '';
    }
    var braceCount = 0;
    var l = _string.length;
    for (int i = 0; i < l; ++i) {
      var ch = _string[i];
      if (ch == '{') {
        ++braceCount;
      } else if (ch == '}') {
        --braceCount;
      }
      if (braceCount == 0 && i > 1) {
        var validJsonString = _string.substring(0, i + 1);
        _string = _string.substring(i + 1);
        print("parse result = $validJsonString");
        var response = CameraResponse(validJsonString);
        callback(response);
        return true;
      }
    }
    return false;
  }
}
