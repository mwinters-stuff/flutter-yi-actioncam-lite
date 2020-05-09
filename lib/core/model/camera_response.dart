
import 'dart:convert';

class CameraResponse{
  Map<String,dynamic> _data;
  int _messageId;

  get messageId => _messageId;

  get data => _data;

  get isNotification => _messageId == 7 || _messageId == 1793;

  get notificationType => _data['type'];

  CameraResponse(String responseString){
    _data = json.decode(responseString);
    _messageId = _data['msg_id'];
  }

}
