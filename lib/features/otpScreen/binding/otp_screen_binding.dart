import 'package:get/get.dart';
import 'package:irctctest/features/otpScreen/controller/otp_screen_controller.dart';

class OtpScreenBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(OtpScreenController());
  }

}