import 'package:client/modules/auth/login/login_binding.dart';
import 'package:get/route_manager.dart';

import './route_names.dart';

import '../modules/auth/login/login_page.dart';
import '../modules/onboard/onboard_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRouteNames.login,
      page: () => const Login(),
    ),
    GetPage(
      name: AppRouteNames.onBoard,
      page: () => const OnBoard(),
    ),
  ];
}
