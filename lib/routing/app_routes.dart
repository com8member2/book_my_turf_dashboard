

import 'package:book_my_turf_dashboard/features/auth/login_screen.dart';
import 'package:book_my_turf_dashboard/features/dashboard/presentation/dasboard.dart';
import 'package:flutter/cupertino.dart';


class AppRoutes {
  static const loginScreen = "login_screen";
  static const dashboard = "dasboard";


  static Map<String, Widget Function(BuildContext)> routes = {
    loginScreen: (p0) =>  LoginScreen(),
    dashboard: (p0) =>  Dashboard(),


  };
}
