class ErrorCode
{
  static const int Success = 0;
  static const int Cancelled = -2147483647;
  static const int InvalidState = -2147483646;
  static const int IOException = -2147483645;
  static const int InvalidParameter = -2147483644;
  static const int NotSupported = -2147483643;
  static const int InvalidResponse = -2147483642;
  static const int CommandFailed = -2147483641;
  static const int InvalidFormat = -2147483640;
  static const int PreConditionFailed = -2147483639;
  static const int Timeout = -2147483638;
  static const int CameraIsBusy = -2147483637;
  static const int ReachMaxClients = -2147483636;
  static const int HDMIInserted = -2147483635;
  static const int NoSpace = -2147483634;
  static const int CardProtected = -2147483633;
  static const int NoMemory = -2147483632;
  static const int PhotoInVideoIsNotAllowed = -2147483631;
  static const int SDCardIsNotExisted = -2147483630;
  static const int SDCardIsNotFormated = -2147483629;
  static const int BatteryIsLow = -2147483628;
  static const int SDCardCapacityIsLow = -2147483627;
  static const int BluetoothIsBinding = -2147483626;
  static const int NoSpaceForLoopRecording = -2147483625;


  static int convertFirmwareError(final int error) {
    switch (error) {
      case -5: {
        return ErrorCode.ReachMaxClients;
      }
      case -16: {
        return ErrorCode.HDMIInserted;
      }
      case -17: {
        return ErrorCode.NoSpace;
      }
      case -18: {
        return ErrorCode.CardProtected;
      }
      case -19: {
        return ErrorCode.NoMemory;
      }
      case -20: {
        return ErrorCode.PhotoInVideoIsNotAllowed;
      }
      case -21: {
        return ErrorCode.CameraIsBusy;
      }
      case -27: {
        return ErrorCode.SDCardIsNotExisted;
      }
      case -28: {
        return ErrorCode.SDCardIsNotFormated;
      }
      case -29: {
        return ErrorCode.BatteryIsLow;
      }
      case -31: {
        return ErrorCode.SDCardCapacityIsLow;
      }
      case -32: {
        return ErrorCode.BluetoothIsBinding;
      }
      case -37: {
        return ErrorCode.NoSpaceForLoopRecording;
      }
      default: {
        return error;
      }
    }
  }
}