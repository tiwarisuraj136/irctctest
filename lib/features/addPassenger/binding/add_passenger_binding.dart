import 'package:get/get.dart';
import 'package:irctctest/features/addPassenger/controller/add_passenger_controller.dart';

class AddPassengerBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AddPassengerController());
  }

}