import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/bases/base_view.dart';
import 'package:myapp/app/cores/values/app_colors.dart';
import 'package:myapp/app/cores/widgets/appbar.dart';
import 'package:myapp/app/modules/main/controllers/main_controller.dart';

class MainView extends BaseView<MainController> {
  MainView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return MyAppbar.main(title: "title");
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(e
              decoration: BoxDecoration(
                color: AppColors.primaryPlaceholder,
              ),
              width: 206,
              height: 247,
            ),
            SizedBox()
        ,          ElevatedButton(
              onPressed: () {
                controller.button_tapped();
              },
              child: Text("login ${controller.click_count.value}"),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget? bottomNavigationBar(BuildContext context) {
    return null;
  }
}
