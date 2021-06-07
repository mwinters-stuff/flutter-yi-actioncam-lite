import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_yi_actioncam_lite/core/bloc/bloc.dart';
import 'package:flutter_yi_actioncam_lite/core/model/camera_commands/camera_commands.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockStartSession extends Mock implements StartSession {}

class MockBatteryQuantity extends Mock implements BatteryQuantity {}
//
//void main() {
//  group('CameraDataBloc', () {
//    CameraDataBloc cameraDataBloc;
//    MockStartSession mockStartSession = MockStartSession();
//    MockBatteryQuantity mockBatteryQuantity = MockBatteryQuantity();
//
//
//    setUp(() {
//      cameraDataBloc = CameraDataBloc();
//    });
//
//    tearDown(() {
//      cameraDataBloc.close();
//    });
//
//    test('initial state is InitialCameraDataState', () {
//      expect(cameraDataBloc.initialState, InitialCameraDataState());
//    });
//
//    blocTest(
//      'emits StartSessionState when StartSessionDataEvent added',
//      build: () async => cameraDataBloc,
//      act: (bloc) async => bloc.add(StartSessionDataEvent(startSession: mockStartSession)),
//      expect: [StartSessionState(startSession: mockStartSession)],
//    );
//
//    blocTest(
//      'emits BatteryQuantityState when BatteryQuantityDataEvent added',
//      build: () async => cameraDataBloc,
//      act: (bloc) async => bloc.add(BatteryQuantityDataEvent(getBatteryQuantity: mockBatteryQuantity)),
//      expect: [BatteryQuantityState(getBatteryQuantity: mockBatteryQuantity)],
//    );
//  });
//}
