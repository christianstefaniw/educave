import 'package:flutter/material.dart';

import '../modules/auth/login/login_page.dart';
import '../modules/onboard/onboard_page.dart';

part 'route_names.dart';

abstract class AppRoutes {
  static final names = _AppRouteNames();

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      names.onBoard: (_) => const OnBoard(),
      names.login: (_) => const Login()
    };
  }
}
