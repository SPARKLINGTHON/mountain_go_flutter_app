import 'dart:ui';

import 'package:get/get.dart';
import 'package:myapp/app/cores/values/app_colors.dart';
import 'package:myapp/app/data/mountain_metadata.dart';

class MainController extends GetxController{
  final RxList<MountainMetadata> _rxMountainMetadataList = RxList<MountainMetadata>.empty();
  List<MountainMetadata> get mountainMetadataList =>  _rxMountainMetadataList.value;

  @override
  void onInit() {
    _rxMountainMetadataList(Get.arguments["mountainMetadataList"]);
    super.onInit();
  }

  Color levelColor(int level){
    switch(level){
      case 1:
        return AppColors.levelOne;
      case 2:
        return AppColors.levelTwo;
      case 3:
        return AppColors.levelThree;
      case 4:
        return AppColors.levelFour;
      case 5:
        return AppColors.levelFive;
      default:
        return AppColors.levelFive;
    }
  }

  VoidCallback gridItemTapped(){
    return (){

    };
  }
}