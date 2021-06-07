import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_yi_actioncam_lite/core/model/types/types.dart';
import 'package:flutter_yi_actioncam_lite/core/services/services.dart';
import 'package:provider/provider.dart';

class ActionCameraSettings extends ChangeNotifier {
  static const AppStatusSettingName = "app_status";
  static const CameraClockSettingName = "camera_clock";
  static const SoftwareVersionSettingName = "sw_version";
  static const HardwareVersionSettingName = "hw_version";
  static const SerialNumberSettingName = "serial_number";
  static const ProductNameSettingName = "product_name";
  static const SystemModeSettingName = "system_mode";
  static const VideoStandardSettingName = "video_standard";
  static const VideoResolutionSettingName = "video_resolution";
  static const VideoQualitySettingName = "video_quality";
  static const PhotoQualitySettingName = "photo_quality";
  static const PhotoResolutionSettingName = "photo_size";
  static const PhotoWhiteBalanceSettingName = "iq_photo_wb";
  static const VideoWhiteBalanceSettingName = "iq_video_wb";
  static const PhotoISOSettingName = "iq_photo_iso";
  static const VideoISOSettingName = "iq_video_iso";
  static const PhotoExposureValueSettingName = "iq_photo_ev";
  static const VideoExposureValueSettingName = "iq_video_ev";
  static const PhotoShutterTimeSettingName = "iq_photo_shutter";
  static const VideoSharpnessSettingName = "video_sharpness";
  static const PhotoSharpnessSettingName = "photo_sharpness";
  static const DefaultFileRootInCamera = "/tmp/fuse_d/DCIM/100MEDIA/";
  static const DefaultFileDownloadURLBase = "/DCIM/100MEDIA/";
  static const FieldOfViewSettingName = "fov";
  static const MeteringModeSettingName = "meter_mode";
  static const VideoColorModeSettingName = "video_flat_color";
  static const PhotoColorModeSettingName = "photo_flat_color";
  static const ElectronicImageStabilizationSettingName = "iq_eis_enable";
  static const VideoTimestampSettingName = "video_stamp";
  static const PhotoTimestampSettingName = "photo_stamp";
  static const VideoMuteSettingName = "video_mute_set";
  static const LEDModeSettingName = "led_mode";
  static const ScreenAutoLockSettingName = "screen_auto_lock";
  static const AutoPowerOffSettingName = "auto_power_off";
  static const VideoRotateSettingName = "video_rotate";
  static const BuzzerVolumeSettingName = "buzzer_volume";
  static const BuzzerRingSettingName = "buzzer_ring";
  static const RecordModeSettingName = "rec_mode";
  static const CaptureModeSettingName = "capture_mode";
  static const TimeLapseVideoIntervalSettingName = "timelapse_video";
  static const TimeLapsePhotoIntervalSettingName = "precise_cont_time";
  static const TimeLapseVideoDurationSettingName = "timelapse_video_duration";
  static const AdjustLensDistortionStateSettingName = "warp_enable";
  static const BurstCaptureNumberSettingName = "burst_capture_number";

  static const RestoreFactorySettingsSettingName = "restore_factory_settings";
  static const RestoreWifiSettingName = "restore_wifi";
  static const RestoreBlueToothSettingsSettingName = "restore_bt";
  static const WifiSSIDSettingName = "wifi_ssid";
  static const WifiPasswordSettingName = "wifi_password";
  static const STASSIDSettingName = "sta_ssid";
  static const STAPasswordSettingName = "sta_password";
  static const STAConnectPasswordSettingName = "sta_connect_password";
  static const STAIPSettingName = "sta_ip";
  static const WifiModeSettingName = "wifi_mode";
  static const SDCardStatusSettingName = "sd_card_status";
  static const DualStreamStatusSettingName = "dual_stream_status";
  static const StreamingStatusSettingName = "streaming_status";
  static const PreciseContCapturingSettingName = "precise_cont_capturing";
  static const PIVEnableSettingName = "piv_enable";
  static const AutoLowLightSettingName = "auto_low_light";
  static const SupportAutoLowLightSettingName = "support_auto_low_light";
  static const PreciseSelfTimeSettingName = "precise_selftime";
  static const PreciseSelfRunningSettingName = "precise_self_running";
  static const SystemDefaultModeSettingName = "system_default_mode";
  static const PreciseSelfRemainTimeSettingName = "precise_self_remain_time";
  static const SDCardNeedFormatSettingName = "sdcard_need_format";
  static const PhotoRecordTimeSettingName = "record_photo_time";
  static const DevFunctionsSettingName = "dev_functions";
  static const TimeLapseVideoResolutionSettingName =
      "timelapse_video_resolution";
  static const VideoPhotoResolutionSettingName = "video_photo_resolution";
  static const SlowMotionRateSettingName = "slow_motion_rate";
  static const SlowMotionResolutionSettingName = "slow_motion_resolution";
  static const LoopRecDurationSettingName = "loop_rec_duration";
  static const ProTuneSettingName = "protune";
  static const DewarpSupportStatusSettingName = "dewarp_support_status";
  static const EISSupportStatusSettingName = "eis_support_status";
  static const VideoVolumeSettingName = "video_volume_set";
  static const LongShutterDefineSettingName = "long_shutter_define";
  static const StampEnableSettingName = "stamp_enable";
  static const EVEnableSettingName = "ev_enable";
  static const WifiCountrySettingName = "wifi_country";
  static const WifiCountryEditableSettingName = "wifi_country_editable";
  static const RecAudioSupportSettingName = "rec_audio_support";
  static const SupportFlatColorSettingName = "support_flat_color";
  static const SupportSharpnessSettingName = "support_sharpness";
  static const TimeLapsePhotoShutterSettingName = "timelapse_photo_shutter";
  static const SupportFOVSettingName = "support_fov";
  static const SupportISOSettingName = "support_iso";
  static const SupportWBSettingName = "support_wb";
  static const RecButtonModeSettingName = "rc_button_mode";
  static const VideoLoopResolutionSettingName = "video_loop_resolution";
  static const AutoGainControlSettingName = "auto_gain_ctrl";
  static const SupportAutoGainControlSettingName = "support_auto_gain_ctrl";

  final Map<String, String> otherSettings = HashMap();

  CameraStatus status;
  DateTime clock;
  String softwareVersion;
  String hardwareVersion;
  String serialNumber;
  String productName;
  SystemMode systemMode;
  VideoStandard videoStandard;
  VideoResolution videoResolution;
  Quality videoQuality;
  Quality photoQuality;
  PhotoResolution photoResolution;
  WhiteBalance photoWhiteBalance;
  WhiteBalance videoWhiteBalance;
  ISO photoISO;
  ISO videoISO;
  ExposureValue photoExposureValue;
  ExposureValue videoExposureValue;
  ShutterTime photoShutterTime;
  Sharpness videoSharpness;
  Sharpness photoSharpness;
  FieldOfView videoFieldOfView;
  MeteringMode meteringMode;
  ColourMode videoColorMode;
  ColourMode photoColorMode;
  ToggleState electronicImageStabilizationState;
  Timestamp videoTimestamp;
  Timestamp photoTimestamp;
  ToggleState videoMuteState;
  LEDMode ledMode;
  ScreenAutoLock screenAutoLock;
  AutoPowerOff autoPowerOff;
  VideoRotateMode videoRotateMode;
  BuzzerVolume buzzerVolume;
  ToggleState buzzerRing;
  RecordMode recordMode;
  CaptureMode captureMode;
  TimeLapseVideoInterval timeLapseVideoInterval;
  TimeLapsePhotoInterval timeLapsePhotoInterval;
  TimeLapseVideoDuration timeLapseVideoDuration;
  ToggleState adjustLensDistortionState;
  String burstCaptureNumber;

  String defaultFileRootInCamera;

  List<Widget> _configWidgets = List();

  List<Widget> get configWidgets => _configWidgets;

  void parseSettingValue(final String settingName, final String settingValue) {
    print("Setting \'$settingName\': \'$settingValue\'");
    switch (settingName) {
      case AppStatusSettingName:
        status = CameraStatus.parse(settingValue);
        _configWidgets.add(CameraStatus.getWidget());
        break;
      case CameraClockSettingName:
        break;
      case SoftwareVersionSettingName:
        softwareVersion = settingValue;
        _configWidgets.add(TextROWidget('Software Version', settingValue));
        break;
      case HardwareVersionSettingName:
        hardwareVersion = settingValue;
        _configWidgets.add(TextROWidget('Hardware Version', settingValue));
        break;
      case SerialNumberSettingName:
        serialNumber = settingValue;
        _configWidgets.add(TextROWidget('Serial Number', settingValue));
        break;
      case ProductNameSettingName:
        productName = settingValue;
        _configWidgets.add(TextROWidget('Product Name', settingValue));
        break;
      case SystemModeSettingName:
        parseSystemMode(settingValue);
        _configWidgets.add(TextROWidget('System Mode', settingValue));
        break;
      case VideoStandardSettingName:
        videoStandard = VideoStandard.parse(settingValue);
        _configWidgets.add(VideoStandard.getWidget());
        break;
      case VideoResolutionSettingName:
        videoResolution = VideoResolution.parse(settingValue);
        _configWidgets.add(VideoResolution.getWidget());
        break;
      case VideoQualitySettingName:
        videoQuality = Quality.parse(settingValue);
        _configWidgets.add(Quality.getWidget(VideoOrPhoto.video));
        break;
      case PhotoQualitySettingName:
        photoQuality = Quality.parse(settingValue);
        _configWidgets.add(Quality.getWidget(VideoOrPhoto.photo));
        break;
      case PhotoResolutionSettingName:
        photoResolution = PhotoResolution.parse(settingValue);
        _configWidgets.add(PhotoResolution.getWidget());
        break;
      case PhotoWhiteBalanceSettingName:
        photoWhiteBalance = WhiteBalance.parse(settingValue);
        _configWidgets.add(WhiteBalance.getWidget(VideoOrPhoto.photo));
        break;
      case VideoWhiteBalanceSettingName:
        videoWhiteBalance = WhiteBalance.parse(settingValue);
        _configWidgets.add(WhiteBalance.getWidget(VideoOrPhoto.video));
        break;
      case PhotoISOSettingName:
        photoISO = ISO.parse(settingValue);
        _configWidgets.add(ISO.getWidget(VideoOrPhoto.photo));
        break;
      case VideoISOSettingName:
        videoISO = ISO.parse(settingValue);
        _configWidgets.add(ISO.getWidget(VideoOrPhoto.video));
        break;
      case PhotoExposureValueSettingName:
        photoExposureValue = ExposureValue.parse(settingValue);
        _configWidgets.add(ExposureValue.getWidget(VideoOrPhoto.photo));
        break;
      case VideoExposureValueSettingName:
        videoExposureValue = ExposureValue.parse(settingValue);
        _configWidgets.add(ExposureValue.getWidget(VideoOrPhoto.video));
        break;
      case PhotoShutterTimeSettingName:
        photoShutterTime = ShutterTime.parse(settingValue);
        _configWidgets.add(ShutterTime.getWidget());
        break;
      case VideoSharpnessSettingName:
        videoSharpness = Sharpness.parse(settingValue);
        _configWidgets.add(Sharpness.getWidget(VideoOrPhoto.video));
        break;
      case PhotoSharpnessSettingName:
        photoSharpness = Sharpness.parse(settingValue);
        _configWidgets.add(Sharpness.getWidget(VideoOrPhoto.photo));
        break;
      case DefaultFileRootInCamera:
        defaultFileRootInCamera = settingValue;
        _configWidgets.add(TextROWidget('File Root In Camera', settingValue));
        break;
      case DefaultFileDownloadURLBase:
        break;
      case FieldOfViewSettingName:
        videoFieldOfView = FieldOfView.parse(settingValue);
        _configWidgets.add(FieldOfView.getWidget());
        break;
      case MeteringModeSettingName:
        meteringMode = MeteringMode.parse(settingValue);
        _configWidgets.add(MeteringMode.getWidget());
        break;
      case VideoColorModeSettingName:
        videoColorMode = ColourMode.parse(settingValue);
        _configWidgets.add(ColourMode.getWidget(VideoOrPhoto.video));
        break;
      case PhotoColorModeSettingName:
        photoColorMode = ColourMode.parse(settingValue);
        _configWidgets.add(ColourMode.getWidget(VideoOrPhoto.photo));
        break;
      case ElectronicImageStabilizationSettingName:
        electronicImageStabilizationState = ToggleState.parse(settingValue);
        _configWidgets.add(ToggleState.getWidget(
            ToggleStateSettings.electronicImageStabilization));
        break;
      case VideoTimestampSettingName:
        videoTimestamp = Timestamp.parse(settingValue);
        _configWidgets.add(Timestamp.getWidget(VideoOrPhoto.video));
        break;
      case PhotoTimestampSettingName:
        photoTimestamp = Timestamp.parse(settingValue);
        _configWidgets.add(Timestamp.getWidget(VideoOrPhoto.photo));
        break;
      case VideoMuteSettingName:
        videoMuteState = ToggleState.parse(settingValue);
        _configWidgets
            .add(ToggleState.getWidget(ToggleStateSettings.videoMute));
        break;
      case LEDModeSettingName:
        ledMode = LEDMode.parse(settingValue);
        _configWidgets.add(LEDMode.getWidget());
        break;
      case ScreenAutoLockSettingName:
        screenAutoLock = ScreenAutoLock.parse(settingValue);
        _configWidgets.add(ScreenAutoLock.getWidget());
        break;
      case AutoPowerOffSettingName:
        autoPowerOff = AutoPowerOff.parse(settingValue);
        _configWidgets.add(AutoPowerOff.getWidget());
        break;
      case VideoRotateSettingName:
        videoRotateMode = VideoRotateMode.parse(settingValue);
        _configWidgets.add(VideoRotateMode.getWidget());
        break;
      case BuzzerVolumeSettingName:
        buzzerVolume = BuzzerVolume.parse(settingValue);
        _configWidgets.add(BuzzerVolume.getWidget());
        break;
      case BuzzerRingSettingName:
        buzzerRing = ToggleState.parse(settingValue);
        _configWidgets
            .add(ToggleState.getWidget(ToggleStateSettings.buzzerRing));
        break;
      case RecordModeSettingName:
        recordMode = RecordMode.parse(settingValue);
        _configWidgets.add(RecordMode.getWidget());
        break;
      case CaptureModeSettingName:
        captureMode = CaptureMode.parse(settingValue);
        _configWidgets.add(CaptureMode.getWidget());
        break;
      case TimeLapseVideoIntervalSettingName:
        timeLapseVideoInterval = TimeLapseVideoInterval.parse(settingValue);
        _configWidgets.add(TimeLapseVideoInterval.getWidget());
        break;
      case TimeLapsePhotoIntervalSettingName:
        timeLapsePhotoInterval = TimeLapsePhotoInterval.parse(settingValue);
        _configWidgets.add(TimeLapsePhotoInterval.getWidget());
        break;
      case TimeLapseVideoDurationSettingName:
        timeLapseVideoDuration = TimeLapseVideoDuration.parse(settingValue);
        _configWidgets.add(TimeLapseVideoDuration.getWidget());
        break;
      case AdjustLensDistortionStateSettingName:
        adjustLensDistortionState = ToggleState.parse(settingValue);
        _configWidgets.add(
            ToggleState.getWidget(ToggleStateSettings.adjustLensDistortion));
        break;
      case BurstCaptureNumberSettingName:
        burstCaptureNumber = settingValue;
        _configWidgets.add(TextROWidget('Burst Capture Number', settingValue));
        break;
      default:
        otherSettings[settingName] = settingValue;
        _configWidgets.add(TextROWidget(settingName, settingValue));
    }
  }

  void parseSystemMode(String value) {
    switch (value) {
      case "capture":
        this.systemMode = SystemMode.Capture;
        break;
      case "record":
        this.systemMode = SystemMode.Record;
        break;
      default:
        this.systemMode = SystemMode.Unknown;
    }
  }

  void loadSettings(HashMap<String, String> params) {
    _configWidgets.clear();
    otherSettings.clear();
    params.forEach((key, value) => parseSettingValue(key, value));
    notifyListeners();
  }

  void changed() {
    notifyListeners();
  }

  void clear() {
    _configWidgets.clear();
    otherSettings.clear();
    notifyListeners();
  }

  getSettings(BuildContext context) {
    Provider.of<CameraService>(context, listen: false).getSettings(context);
  }
}
