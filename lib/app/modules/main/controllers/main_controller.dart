import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/values/app_colors.dart';
import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:share_plus/share_plus.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class MainController extends GetxController {
  final RxList<MountainMetadata> _rxMountainMetadataList =
      RxList<MountainMetadata>.empty();

  List<MountainMetadata> get mountainMetadataList =>
      _rxMountainMetadataList.value;

  final RxBool _isAscending = true.obs;

  bool get isAscending => _isAscending.value;

  static const _storage = FlutterSecureStorage();

  WidgetsToImageController widgetsToImageController =
      WidgetsToImageController();
  Uint8List? bytes;

  @override
  void onInit() {
    _rxMountainMetadataList(Get.arguments["mountainMetadataList"]);
    super.onInit();
  }

  Color levelColor(int level) {
    switch (level) {
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

  VoidCallback gridItemTapped(MountainMetadata data) {
    return () async {
      if (data.conquered) {
        Get.dialog(
          Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: AppColors.transparency,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              child: WidgetsToImage(
                  child: await certificateWidget(data),
                  controller: widgetsToImageController)),
        );
      } else {
        Get.snackbar("error", "우선 해당 산을 정복해야합니다.");
      }
    };
  }

  void itemSort(int condition) {
    bool tempAscending = condition == 0 ? true : false;

    if (isAscending != tempAscending) {
      List<MountainMetadata> temp = mountainMetadataList;
      temp.sort((a, b) => a.level.compareTo(b.level));
      _rxMountainMetadataList(List.from(tempAscending ? temp : temp.reversed));
      _isAscending(!isAscending);
    }
  }

  VoidCallback onShare(MountainMetadata data) {
    return () async {
      final bytes = await widgetsToImageController.capture();
      if (bytes == null) {
        print("bytes are null");
        return;
      }
      XFile xFile = XFile.fromData(bytes, mimeType: 'image/png');
      final result = await Share.shareXFiles([xFile]);

      if (result.status == ShareResultStatus.success) {
        print('Thank you for sharing the picture!');
      }
    };
  }

  Future<Widget> certificateWidget(MountainMetadata data) async {
    return Stack(
      children: [
        Image.asset(
          "assets/images/dialog.png",
          fit: BoxFit.fitHeight,
          width: 463,
          height: 507,
        ),
        Positioned(
            top: 124,
            left: 0,
            right: 0,
            child: Text(
              await _storage.read(key: "id") ?? "",
              style: const TextStyle(fontSize: 32, fontFamily: "ITCEDSCR"),
              textAlign: TextAlign.center,
            )),
        Positioned(
          top: 181,
          left: 0,
          right: 0,
          child: Center(
            child: Image.network(
              data.imageLink,
              width: 120,
              height: 160,
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        Positioned(
          left: 105.5,
          right: 120,
          bottom: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                data.conquerDate.toString(),
                style: const TextStyle(
                  fontSize: 5,
                ),
              ),
              Text(
                await _storage.read(key: "id") ?? "",
                style: TextStyle(fontSize: 5),
              ),
            ],
          ),
        ),
        Positioned(
          right: 50,
          bottom: 10,
          child: IconButton(
            onPressed: onShare(data),
            icon: const Icon(
              Icons.share,
              size: 30,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
