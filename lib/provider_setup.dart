
import 'package:flutterYiActionCameraLite/core/model/camera_commands/camera_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_battery_quantity.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/get_settings.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/start_session.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/start_view_finder.dart';
import 'package:flutterYiActionCameraLite/core/model/camera_commands/stop_view_finder.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<CameraService>(
    create:(_) => CameraService()
    ),
  ChangeNotifierProvider<StartSession>(
    create:(_) => StartSession()
  ),
  ChangeNotifierProvider<GetBatteryQuantity>(
      create:(_) => GetBatteryQuantity()
  ),
  ChangeNotifierProvider<GetSettings>(
      create:(_) => GetSettings()
  ),
  ChangeNotifierProvider<ActionCameraSettings>(
      create:(_) => ActionCameraSettings()
  ),
  ChangeNotifierProvider<StartViewFinder>(
      create:(_) => StartViewFinder()
  ),
  ChangeNotifierProvider<StopViewFinder>(
      create:(_) => StopViewFinder()
  ),

];

List<SingleChildWidget> dependentServices = [
];

List<SingleChildWidget> uiConsumableProviders = [
];