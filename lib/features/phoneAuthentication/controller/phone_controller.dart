import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:irctctest/core/globals.dart' as glb;

class PhoneController extends GetxController with CodeAutoFill{
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxString verificationId = "".obs;
  RxString smsCode = "".obs;
  RxBool isCorrectNumber = false.obs;
  RxBool otpSent = false.obs;
  RxInt counter = 0.obs;
  RxBool flag = true.obs;
  Timer? _timer;
  RxBool verified = true.obs;
  RxString codeValue= "".obs;
  String appSignature = "";

  RxMap sendOtpData = {}.obs;

  void onDispose()
  {
    super.dispose();
    cancel();
  }


  @override
  void onInit()
  {
    super.onInit();
    listenForCode();
    SmsAutoFill().getAppSignature.then((signature) {
      appSignature = signature;});
  }











  @override
  void onClose() {
    _timer?.cancel();

    super.onClose();
  }


  resendOtp() {
    if (counter.value == 0) {
      phoneAuthentication();
      startTimer();
    }
  }

  startTimer() {
    counter.value = 30;
    flag.value = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (counter.value > 0) {
        counter.value--;
      } else {
        flag.value = true;
        timer.cancel();
      }
    });
  }

  onEdit() {
    otpSent.value = false;
  }

  Future<void> setLoginValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isLogin", glb.isLogin.value);
    glb.loginCheck();
  }

  String? validatePhone(String? value) {
    if (value == null || value.length != 10) {
      return "Please enter Number correctly";
    } else {
      return null;
    }
  }

  verifyOTP() async {
    try {
      await FirebaseAuth.instance.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationId.value,
          smsCode: otpController.text,
        ),
      );

      Get.defaultDialog(
        title: "Success",
        content: Column(
          children: [
            const Center(
              child: Image(
                image: AssetImage("assets/successful.png"),
                width: 150,
                height: 150,
              ),
            ),
            const Text("OTP verified Successfully"),
            ElevatedButton(
              onPressed: () {
                glb.isLogin.value = true;
                setLoginValue();
                Get.back();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              child: const Text(
                "Ok",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      );
      verified.value = true;
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "An error occurred. Please try again.");
      verified.value = false;
    } catch (e) {
      Get.snackbar("Error", e.toString());
      verified.value = false;
    }
  }

  phoneAuthentication() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (credential) {
        auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        otpSent.value = false;
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", "Recheck the number");
        } else {
          Get.snackbar("Error", "Try Again Later");
        }
      },
      codeSent: (verificationId, resendToken) {
        Get.snackbar("Success", "OTP sent Successfully");
        this.verificationId.value = verificationId;
        otpSent.value = true;
        verified.value = true;

      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
    );
  }

  backTo() {
    Get.offNamed(RoutesConstant.login);
  }

  formValidate() {
    var isValid = loginKey.currentState!.validate();
    if (!isValid) {
      isCorrectNumber.value = false;
      return null;
    } else {
      isCorrectNumber.value = true;
      phoneAuthentication();
    }
  }

  @override
  void codeUpdated() {
    codeValue.value=code!;
    // TODO: implement codeUpdated
  }
}
