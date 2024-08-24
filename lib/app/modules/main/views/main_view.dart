import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/bases/base_safe_area_view.dart';
import 'package:myapp/app/cores/values/app_colors.dart';
import 'package:myapp/app/cores/widgets/appbar.dart';
import 'package:myapp/app/data/mountain_metadata.dart';
import 'package:myapp/app/modules/main/controllers/main_controller.dart';
import "dart:math" as math;

class MainView extends BaseSafeAreaView<MainController> {
  MainView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return MyAppbar.main(nickname: "Kelly");
  }

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Image.asset(
              "assets/images/mountain_icon.png",
              width: 50,
              height: 50,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "산 도감",
              style: TextStyle(fontSize: 20),
            ),
            // AnimatedToggleSwitch.size(
            //   current: controller.isAscending,
            //   values: [
            //     const [0, 1]
            //   ],
            // )
          ],
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 92 / 127),
            itemBuilder: (BuildContext context, int index) {
              return mountainCard(
                  context, controller.mountainMetadataList[index]);
            },
            itemCount: controller.mountainMetadataList.length,
          ),
        ),
      ],
    );
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }

  Widget mountainCard(BuildContext context, MountainMetadata data) {
    return GestureDetector(
        onTap: controller.gridItemTapped,
        child: Padding(
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
                            child: CachedNetworkImage(
                              imageUrl: data.imageLink,
                              placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )),
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
              if (data.conquered)
                Positioned(
                  child: Center(
                    child: Transform.rotate(
                      angle: -19.7 * math.pi / 180,
                      child: Container(
                        width: 150,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            width: 5,
                            color: AppColors.primaryRed,
                          ),
                        ),
                        child: Text(
                          "Achieve",
                          style: TextStyle(
                            color: AppColors.primaryRed,
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
