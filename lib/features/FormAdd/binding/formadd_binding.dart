import 'package:get/get.dart';
import 'package:irctctest/features/FormAdd/controller/formadd_controller.dart';

class FormAddBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(FormAddController());
    // TODO: implement dependencies
  }

}