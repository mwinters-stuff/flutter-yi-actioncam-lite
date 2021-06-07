import 'package:flutter/material.dart';
import 'package:flutter_app/ui/base_page.dart';

mixin BaseScreen<Page extends BasePage> on BaseState<Page> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text(screenName()),
          actions: actions(context)
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: bottomNavigationBar(context),
        body: body(context));
  }

  Widget body(BuildContext context);

  List<Widget> actions(BuildContext context);

  BottomNavigationBar bottomNavigationBar(BuildContext context);



}