import 'package:flutter/material.dart';

import '../modules/account/profile_screen.dart';
import '../modules/app/app_control.dart';
import '../modules/auth/login/login_screen.dart';
import '../modules/calendar/calendar_page.dart';
import '../modules/create_post/screens/create_post.dart';
import '../modules/group/group_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/onboard/onboard_control.dart';
import '../modules/search/search_control.dart';
import 'route_names.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRouteNames.onBoard: (_) => const OnBoardControl(),
  AppRouteNames.login: (_) => const Login(),
  AppRouteNames.app: (_) => const AppControl(),
  AppRouteNames.home: (_) => const Home(),
  AppRouteNames.search: (_) => const SearchControl(),
  AppRouteNames.createPost: (_) => const CreatePost(),
  AppRouteNames.calendar: (_) => const Calendar(),
  AppRouteNames.profile: (_) => const Profile(),
  AppRouteNames.group: (_) => const Group(),
};
