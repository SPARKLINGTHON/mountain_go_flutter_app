import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/bases/base_safe_area_view.dart';
import 'package:myapp/app/cores/widgets/appbar.dart';
import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:myapp/app/modules/main/controllers/main_controller.dart';

class MainView extends BaseSafeAreaView<MainController> {
  MainView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return MyAppbar.main(nickname: "Kelly");
  }

  @override
  Widget body(BuildContext context) {
    // return Obx(() {
    //   return SliverGrid(
    //     delegate: SliverChildBuilderDelegate(
    //       (context, index) {
    //         return mountainCard(
    //             context, controller.mountainMetadataList[index]);
    //       },
    //       childCount: controller.mountainMetadataList.length
    //     ),
    //     gridDelegate:
    //         const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    //   );
    // });
    return Container();
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget mountainCard(BuildContext context, MountainMetadata data) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: controller.levelColor(data.level),
          ),
          width: 92,
          height: 127,
        ),
        Positioned(
          child: Container(),
        )
      ],
    );
  }
}
