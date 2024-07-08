import 'package:get/get.dart';
import 'package:irctctest/features/imgUpload/controller/img_upload_controller.dart';

class ImageUploadBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ImageUploadController());
  }

}