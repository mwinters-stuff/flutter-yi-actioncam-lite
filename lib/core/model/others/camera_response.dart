
import 'dart:convert';

class CameraResponse{
  Map<String,dynamic> _data;
  int _messageId;
  bool _valid;

  bool get valid => _valid;

  get messageId => _messageId;

  get data => _data;

  get isNotification => _messageId == 7 || _messageId == 1793;

  get notificationType => _data['type'];

  CameraResponse(String responseString){
    try {
      _data = json.decode(responseString);
      _messageId = _data['msg_id'];
      _valid = true;
    }catch(FormatException){
      _valid = false;
      _messageId = -1;
    }
  }

}
