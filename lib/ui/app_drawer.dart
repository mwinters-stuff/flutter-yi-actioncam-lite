import 'package:flutter/material.dart';
import 'package:flutterYiActionCameraLite/core/bloc/bloc.dart';
import 'package:flutterYiActionCameraLite/ui/files_screen.dart';
import 'package:flutterYiActionCameraLite/ui/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CameraServiceBloc, CameraServiceState>(builder: (context, cameraState) =>
            Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerHeader(
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Text(
                        cameraState is Connected ? 'Connected' : 'Disconnected',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      )),
                  ListTile(
                    leading: Icon(MdiIcons.imageAlbum),
                    title: Text('Files'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, FilesScreen.RouteName);
                    },
                  ),
                  ListTile(
                    leading: Icon(MdiIcons.cog),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, SettingsScreen.RouteName);
                    },
                  )
                ],
              ),
            ));
  }
}
