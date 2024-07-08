import 'package:get/get.dart';
import 'package:irctctest/features/phoneAuthentication/controller/phone_controller.dart';

class PhoneBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PhoneController());
  }

}