import 'package:get/get.dart';
import 'package:irctctest/features/Logout/controller/logout_controller.dart';

class LogoutBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LogoutController());
    // TODO: implement dependencies
  }

}