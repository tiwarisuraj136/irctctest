import 'package:get/get.dart';
import 'package:irctctest/features/searchTrain/controller/search_train_controller.dart';

class SearchTrainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SearchTrainController());
  }

}