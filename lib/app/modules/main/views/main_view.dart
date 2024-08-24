import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/bases/base_safe_area_view.dart';
import 'package:myapp/app/cores/widgets/appbar.dart';
import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:myapp/app/modules/main/controllers/main_controller.dart';

import '../../../cores/values/app_colors.dart';

class MainView extends BaseSafeAreaView<MainController> {
  MainView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return MyAppbar.main(nickname: "Kelly");
  }

  @override
  Widget body(BuildContext context) {
    return SizedBox(
        width: Get.width,
        height: Get.height,
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: 92 / 127),
          itemBuilder: (BuildContext context, int index) {
            return mountainCard(
                context, controller.mountainMetadataList[index]);
          },
          itemCount: controller.mountainMetadataList.length,
        ));
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget mountainCard(BuildContext context, MountainMetadata data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: controller.levelColor(data.level),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Container(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 1; i <= data.level; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 16,
                        ),
                    ],
                  ),
                  Text(
                    data.name,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
