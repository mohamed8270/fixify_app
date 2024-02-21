// ignore_for_file: file_names

import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHandler extends GetxController {
  var allpermissionGranted = "0".obs;
  var callpermission = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkservice();
  }

  bool checkpermission() {
    if (allpermissionGranted.value == "1") {
      return true;
    } else {
      return false;
    }
  }

  void checkservice() async {
    if (await Permission.phone.isGranted) {
      allpermissionGranted.value == "1";
    } else {
      allpermissionGranted.value == "0";
    }
  }

  void requestservice() async {
    if (!await Permission.phone.request().isGranted) {
      AppSettings.openAppSettings();
    }
    checkservice();
  }
}
