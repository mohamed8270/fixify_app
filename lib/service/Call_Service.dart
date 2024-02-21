// ignore_for_file: file_names

import 'package:fixify_app/constants/theme.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

class CallService extends GetxController {
  final hasCallsupport = true.obs();

  Future<void> makePhoneCall(String phonenumber) async {
    try {
      await FlutterPhoneDirectCaller.callNumber(phonenumber);
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to make call: $e",
        backgroundColor: fRed,
        snackPosition: SnackPosition.BOTTOM,
        colorText: fWhite,
      );
    }
  }
}
