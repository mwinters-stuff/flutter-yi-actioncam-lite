import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/ui/app_drawer.dart';
import 'package:flutterYiActionCameraLite/ui/base_page.dart';


mixin BaseScreen<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(screenName()),
          actions: actions(context),
        ),
        drawer: AppDrawer(),
        backgroundColor: Colors.white,
        body: body(context),
    bottomSheet: bottomSheet(context));
  }

  Widget body(BuildContext context);

  List<Widget> actions(BuildContext context);

  Widget bottomSheet(BuildContext context) => null;
}