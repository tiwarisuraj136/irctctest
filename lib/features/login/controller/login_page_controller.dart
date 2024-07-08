import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController  extends GetxController{
  var isPasswordHidden = true.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


}

