import 'package:get/get.dart';

class MainController extends GetxController{
  RxInt click_count = 0.obs;

  void button_tapped(){
    click_count.value = click_count.value + 1;
  }
}