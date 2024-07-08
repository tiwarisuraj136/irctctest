import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';

class PhoneController extends GetxController {
  final mobileNumberController = TextEditingController();
  final otpController = TextEditingController();
  var timerSeconds = 60.obs;
  var isOTPSent = false.obs;
  var isOTPVerified = false.obs;

  void startTimer() {
    isOTPSent.value = true;
    timerSeconds.value = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerSeconds.value > 0) {
        timerSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void saveMobileNumber() {
    // Save mobile number and send OTP logic here
    startTimer();
  }

  void verifyOTP() {
    // Your OTP verification logic
    bool isOtpValid = true; // Replace with actual verification logic

    if (isOtpValid) {
      showSuccessPopup();
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }

  void showSuccessPopup() {
    Get.defaultDialog(
      title: 'Success',
      content: Column(
        children: [
          Image.asset('assets/successful.png', height: 100, width: 100), // Ensure you have a success image in assets
          const SizedBox(height: 16),
          const Text('OTP Verified Successfully!'),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.toNamed(RoutesConstant.home); // Close the dialog and navigate to the home route
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple, // Change to your desired color
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
