import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/cores/bases/base_view.dart';
import 'package:myapp/app/cores/values/app_colors.dart';
import 'package:myapp/app/modules/login/controllers/login_controller.dart';

class LoginView extends BaseView<LoginController> {
  LoginView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Obx(() {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryPlaceholder,
              ),
              width: 206,
              height: 247,
            ),
            SizedBox(
              height: 195,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryPlaceholder,
              ),
              width: 206,
              height: 42,
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'ID',
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.primaryPlaceholder,
              ),
              width: 206,
              height: 42,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PW',
                ),
              ),
            ),
            SizedBox(
              height: 36,
            ),
            ElevatedButton(
              onPressed: () {
                controller.button_tapped();
              },
              style: ElevatedButton.styleFrom(fixedSize: Size(206, 42)),
              child: Text(
                "login ${controller.click_count.value}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
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
