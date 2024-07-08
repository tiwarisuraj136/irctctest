import 'package:get/get.dart';
import 'package:irctctest/features/signUp/controller/signUp_page_controller.dart';

class SignUpBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }

}