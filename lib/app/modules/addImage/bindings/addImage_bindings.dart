import 'package:get/get.dart';
import 'package:myapp/app/modules/addImage/controllers/addImage_controller.dart';

class AddimageBindings extends Bindings {
  @override
  void dependencies() {
    //Get.lazyPut<GPSController>(() => GPSController());
    Get.put<AddImageController>(AddImageController());
  }
}