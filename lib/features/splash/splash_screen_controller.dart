 import 'dart:async';

import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';

class SplashScreenController extends GetxController{

  @override
  void onReady() {
    Timer(const Duration(seconds: 5), () {
       Get.offAllNamed(RoutesConstant.login);
    });
    super.onReady();
  }


}