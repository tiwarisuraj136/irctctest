import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';

class LoginPageController  extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isPasswordHidden = true.obs;


  var emailError = ''.obs;
  var passwordError = ''.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }



  bool validateInputs() {
    bool isValid = true;
    if (emailController.text.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else {
      emailError.value = '';
    }
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else {
      passwordError.value = '';
    }
    return isValid;
  }



  Future<void> login() async {
    if (validateInputs()) {
      try {
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        Get.snackbar('Success', 'Login successful');
        Get.toNamed(RoutesConstant.home);
        // Navigate to the home screen or another appropriate screen
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emailError.value = 'No user found for that email';
        } else if (e.code == 'wrong-password') {
          passwordError.value = 'Wrong password provided';
        } else {
          Get.snackbar('Error', e.message ?? 'An error occurred');
        }
      }
    }
  }


}

