import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController{
  TextEditingController otpController = TextEditingController();

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}