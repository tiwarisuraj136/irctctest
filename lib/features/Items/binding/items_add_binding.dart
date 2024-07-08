import 'package:get/get.dart';
import 'package:irctctest/features/Items/controller/items_add_controller.dart';

class ItemsAddBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ItemsAddController());
    // TODO: implement dependencies
  }

}