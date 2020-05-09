import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/utils/constants.dart';
import 'package:flutterYiActionCameraLite/provider_setup.dart';
import 'package:flutterYiActionCameraLite/ui/router.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MultiProvider(
        providers: providers,
        child: MaterialApp(
          title: 'Yi Action Camera Lite',
          onGenerateRoute: Router.generateRoute,
          initialRoute: Constants.splashScreenRouteName,
        ));
  }
}
