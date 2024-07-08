import 'package:get/get.dart';
import 'package:irctctest/features/passengerList/controller/passenger_list_controller.dart';

class PassengerListBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(PassengerListController());
  }

}