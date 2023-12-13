

import 'package:book_my_turf_dashboard/features/auth/login_screen.dart';
import 'package:book_my_turf_dashboard/features/root_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consatant/Constants.dart';
import '../features/home/home_screen.dart';
import '../features/home/user/presentation/user_list_screen.dart';

class AAppRoute {
  static const loginScreen = "login_screen";
  static const homeScreen = "home_screen";
  static const userListScreen = 'user_list_screen';
  static const rootScreen = 'root_screen';


  static Map<String, Widget Function(BuildContext)> routes = {
    loginScreen: (p0) =>  LoginScreen(),
    homeScreen: (p0) =>  HomeScreen(),
    userListScreen: (p0) =>  UserListScreen(),
    rootScreen: (p0) =>  RootScreen(),
  };
}



