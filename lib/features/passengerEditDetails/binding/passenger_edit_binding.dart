import 'package:get/get.dart';
import 'package:irctctest/features/passengerEditDetails/controller/passenger_edit_controller.dart';

class PassengerEditBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(PassengerEditController());
  }
}