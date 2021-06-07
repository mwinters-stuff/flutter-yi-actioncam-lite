import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/utils/constants.dart';
import 'package:flutterYiActionCameraLite/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const RouteName = '/splashScreen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final int splashDuration = 1;
//  final AuthenticationService _authenticationService = locator<AuthenticationService>();
//  Timer _timer;

  @override
  void initState() {
    super.initState();
//    _timer = Timer(Duration(seconds: splashDuration), () async{
//      await Navigator.of(context).pushNamedAndRemoveUntil(HomeScreen.RouteName, (_) => false);
//    });
  }

  @override
  void dispose() {
//    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: Colors.black),
                    alignment: FractionalOffset(0.5, 0.3),
                    child: Text(
                      'Yi Action',
                      style: TextStyle(fontSize: 40.0, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                  child: Text(
                    '© Copyright Winters.nz 2020',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )));
  }
}
