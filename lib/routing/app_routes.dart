

import 'package:book_my_turf_dashboard/features/auth/login_screen.dart';
import 'package:book_my_turf_dashboard/features/root_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consatant/Constants.dart';
import '../features/home/home_screen.dart';
import '../features/home/user/presentation/user_list_screen.dart';

class AppRoute {
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



// class AppRoute {
//   static const String login = 'login_screen';
//   static const String home = 'home_screen';
//   static const String userListScreen = 'user_list_screen';
// }
//
// final rootNavigatorKey = GlobalKey<NavigatorState>();
// // final _shellNavigatorKey = GlobalKey<NavigatorState>();
//
// final router = GoRouter(
//   initialLocation: '/Home',
//
//   navigatorKey: rootNavigatorKey,
//   redirect: (context, state) async {
//     return '/Home';
//     // print("state.fullPath ${state.fullPath}");
//     // if (Constants.supabase.auth.currentSession == null) {
//     //   return '/Login';
//     // }
//     // else if (state.fullPath!.contains('/Home')){
//     //   return '/Home';
//     // }
//   },
//   errorPageBuilder: (context, state) {
//     return NoTransitionPage(
//       key: UniqueKey(),
//       child: Scaffold(
//           body: Center(
//             child: Lottie.asset('assets/animation/animation_lmhkmzby.json'),
//           )),
//     );
//   },
//   routes: [
//     GoRoute(
//       parentNavigatorKey: rootNavigatorKey,
//       name: AppRoute.login,
//       path: '/Login',
//       pageBuilder: (context, state) {
//         return NoTransitionPage(
//           key: UniqueKey(),
//           child: LoginScreen(),
//         );
//       },
//     ),
//
//     ShellRoute(
//       builder: (BuildContext context, GoRouterState state, Widget child) {
//         return HomeScreen(path: state.fullPath ?? '/Home', child: child);
//       },
//       routes: <RouteBase>[
//         GoRoute(
//           name: AppRoute.home,
//           path: '/Home',
//           builder: (BuildContext context, GoRouterState state) =>  Dashboard(),
//         ),
//
//       ],
//     ),
//     ShellRoute(routes: [
//       GoRoute(
//         path: '/UserList',
//         name: AppRoute.userListScreen,
//         builder: (BuildContext context,GoRouterState state) => UserListScreen(),
//       )
//     ],builder: (context, state, child) {
//       return UserListScreen();
//     },),
//     // GoRoute(
//     //   path: '/UserList',
//     //   name: AppRoute.userListScreen,
//     //   builder: (BuildContext context,GoRouterState state) => UserListScreen(),
//     // )
//
//
//   ],
// );