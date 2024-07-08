 import 'package:get/get.dart';
import 'package:irctctest/features/splash/splash_screen_controller.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenController());
    // TODO: implement dependencies
  }

}