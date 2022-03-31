import 'package:client/modules/app/app_control.dart';
import 'package:client/modules/calendar/calendar_page.dart';
import 'package:client/modules/groups/groups_page.dart';
import 'package:client/modules/home/home_screen.dart';
import 'package:client/modules/posts/screens/create_post.dart';
import 'package:client/modules/profile/profile_page.dart';
import 'package:flutter/material.dart';

import '../modules/auth/login/login_screen.dart';
import '../modules/onboard/onboard_control.dart';
import 'route_names.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRouteNames.onBoard: (_) => const OnBoardControl(),
  AppRouteNames.login: (_) => const Login(),
  AppRouteNames.app: (_) => const AppControl(),
  AppRouteNames.home: (_) => const Home(),
  AppRouteNames.groups: (_) => const Groups(),
  AppRouteNames.createPost: (_) => const CreatePost(),
  AppRouteNames.calendar: (_) => const Calendar(),
  AppRouteNames.profile: (_) => const Profile(),
};
