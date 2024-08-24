import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController{
  RxInt click_count = 0.obs;

  void button_tapped(){
    Get.toNamed(Routes.MAIN);
  }
}