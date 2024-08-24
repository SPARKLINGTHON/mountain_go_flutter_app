import 'package:get/get.dart';
import 'package:myapp/app/data/mountain_metadata.dart';

class MainController extends GetxController{
  final RxList<MountainMetadata> _rxMountainMetadataList = RxList<MountainMetadata>.empty();
  List<MountainMetadata> get mountainMetadataList =>  _rxMountainMetadataList.value;

  @override
  void onInit() {
    _rxMountainMetadataList(Get.arguments["mountainMetadataList"]);
    super.onInit();
  }
}