import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:irctctest/features/otpScreen/controller/otp_screen_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OtpScreenView extends GetView<OtpScreenController> {
  const OtpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    final String verificationId = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PinFieldAutoFill(
              controller: controller.otpController,
              codeLength: 6,
              onCodeSubmitted: (code) async {
                await _verifyOtp(context, verificationId, code);
              },
              onCodeChanged: (code) {
                if (code?.length == 6) {
                  // Perform verification
                  _verifyOtp(context, verificationId, code!);
                }
              },
              decoration: UnderlineDecoration(
                textStyle: const TextStyle(fontSize: 20, color: Colors.black),
                colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                await _verifyOtp(context, verificationId, controller.otpController.text);
              },
              child: const Text("Verify OTP"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _verifyOtp(BuildContext context, String verificationId, String smsCode) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      Get.toNamed(RoutesConstant.home);
    } catch (ex) {
      log(ex.toString());
      Get.snackbar("Error", "Invalid OTP", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
