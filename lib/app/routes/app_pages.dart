import 'package:get/get.dart';
import 'package:myapp/app/modules/login/bindings/login_bindings.dart';
import 'package:myapp/app/modules/login/views/login_view.dart';

import '../modules/main/bindings/main_bindings.dart';
import '../modules/main/views/main_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DEFAULT_ROUTE;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.DEFAULT_ROUTE,
      page: () => MainView(),
      binding: MainBindings(),
    ),
  ];
}
