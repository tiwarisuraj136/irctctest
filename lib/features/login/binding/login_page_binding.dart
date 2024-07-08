import 'package:get/get.dart';
import 'package:irctctest/features/login/controller/login_page_controller.dart';

class LoginPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
    // TODO: implement dependencies
  }

}