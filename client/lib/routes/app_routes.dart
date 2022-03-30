import 'package:flutter/material.dart';

import '../modules/auth/login/login_page.dart';
import '../modules/home/home_page.dart';
import '../modules/onboard/onboard_page.dart';
import 'route_names.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRouteNames.onBoard: (_) => const OnBoard(),
  AppRouteNames.login: (_) => const Login(),
  AppRouteNames.home: (_) => const Home()
};
