import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:irctctest/core/routes_constant.dart';

class LogoutController extends GetxController{
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signOut() async {
    try {
      await auth.signOut();
      Get.snackbar('Success', 'Log-out successful');
      Get.toNamed(RoutesConstant.login); // Navigate to the login screen
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

}