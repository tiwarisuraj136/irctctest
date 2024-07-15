import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';

  RxBool isLogin = false.obs;
  RxString userProfile = ''.obs;
  Rx<String>passengerDoc ="".obs;
loginCheck() {

  if(isLogin.value)
  {
    Get.offNamed(RoutesConstant.home);}
  else
  {
    Get.offNamed(RoutesConstant.login);
  }
}

 