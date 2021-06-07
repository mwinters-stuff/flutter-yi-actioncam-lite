
import 'package:flutterYiActionCameraLite/core/bloc/bloc.dart';
import 'package:flutterYiActionCameraLite/core/bloc/camera_service_bloc.dart';
import 'package:flutterYiActionCameraLite/core/services/camera_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

List<BlocProvider> blocs = [
  BlocProvider<CameraServiceBloc>(
    create: (context) => CameraServiceBloc(cameraService: RepositoryProvider.of<CameraService>(context))
  ),
  BlocProvider<StartSessionBloc>(
    create: (context) => StartSessionBloc()),
  BlocProvider<BatteryQuantityBloc>(
      create: (context) => BatteryQuantityBloc())
];

List<RepositoryProvider> repositories = [
  RepositoryProvider<CameraService>(
    create: (context) => CameraService(),
  ),

];

List<SingleChildWidget> independentServices = [
//  ChangeNotifierProvider<CameraService>(
//    create:(_) => CameraService()
//    ),
//  ChangeNotifierProvider<StartSession>(
//    create:(_) => StartSession()
//  ),
//  ChangeNotifierProvider<GetBatteryQuantity>(
//      create:(_) => GetBatteryQuantity()
//  ),
//  ChangeNotifierProvider<GetSettings>(
//      create:(_) => GetSettings()
//  ),
//  ChangeNotifierProvider<ActionCameraSettings>(
//      create:(_) => ActionCameraSettings()
//  ),
//  ChangeNotifierProvider<StartViewFinder>(
//      create:(_) => StartViewFinder()
//  ),
//  ChangeNotifierProvider<StopViewFinder>(
//      create:(_) => StopViewFinder()
//  ),
//  ChangeNotifierProvider<GetFileList>(
//      create:(_) => GetFileList()
//  ),

];

List<SingleChildWidget> dependentServices = [
];

List<SingleChildWidget> uiConsumableProviders = [
];