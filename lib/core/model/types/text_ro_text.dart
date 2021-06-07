import 'package:flutter/material.dart';

class TextROWidget extends StatelessWidget {
  final String _title;
  final String _value;

  TextROWidget(this._title, this._value);

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(_title), trailing: Text(_value));
  }
}
