import 'package:book_my_turf_dashboard/features/home/booking/presentation/booking_details_screen.dart';
import 'package:book_my_turf_dashboard/features/home/booking/presentation/booking_screen.dart';
import 'package:book_my_turf_dashboard/features/home/organization/conveniencefees/presentation/convenience_screen.dart';
import 'package:book_my_turf_dashboard/features/home/organization/coupn/presentation/coupn_list_screen.dart';
import 'package:book_my_turf_dashboard/features/home/organization/organization_root_screen.dart';
import 'package:book_my_turf_dashboard/features/home/organization/settings/settings.dart';
import 'package:book_my_turf_dashboard/features/home/owner/presentation/owner_list_screen.dart';
import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_details_screen.dart';
import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_list_screen.dart';
import 'package:book_my_turf_dashboard/model/booking_entity.dart';
import 'package:book_my_turf_dashboard/model/venue_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../consatant/Constants.dart';
import '../features/auth/login_screen.dart';
import '../features/home/home_screen.dart';
import '../features/home/user/presentation/user_list_screen.dart';
import '../features/sub_home_screen.dart';


class AppRoute {
  static const String login = 'login_screen';
  static const String home = 'home_screen';
  static const String subHome = 'sub_home_screen';
  static const String userListScreen = 'user_list_screen';
  static const String bookingsListScreen = 'booking_screen';
  static const String ownerListScreen = 'owner_list_screen';
  static const String venueListScreen = 'venue_list_screen';
  static const String bookingDetailsScreen = 'booking_details_screen';
  static const String venueDetailsScreen = 'venue_details_screen';
  static const String appSettingsScreen = 'settings';
  static const String couponListScreen = 'coupn_list_screen';
  static const String convenienceFeesScreen = 'convenience_screen';


}

final rootNavigatorKey = GlobalKey<NavigatorState>();
// final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/Home',
  navigatorKey: rootNavigatorKey,
  redirect: (context, state) async {
    //return '/Home';
    print("state.fullPath ${state.fullPath}");
    if (Constants.supabase.auth.currentSession == null) {
      return '/Login';
    }

  },
  errorPageBuilder: (context, state) {
    return NoTransitionPage(
      key: UniqueKey(),
      child: Scaffold(
          body: Center(
            child: Lottie.asset('assets/animation/animation_lmhkmzby.json'),
          )),
    );
  },
  routes: [
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      name: AppRoute.login,
      path: '/Login',
      pageBuilder: (context, state) {
        return NoTransitionPage(
          key: UniqueKey(),
          child: LoginScreen(),
        );
      },
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return SubHomeScreen(path: state.fullPath ?? '/Home', child: child);
      },
      routes: <RouteBase>[
        GoRoute(
          name: AppRoute.home,
          path: '/Home',
          builder: (BuildContext context, GoRouterState state) =>  HomeScreen(),
        ),
        GoRoute(
          path: '/Users',
          name: AppRoute.userListScreen,
          builder: (BuildContext context,GoRouterState state) => UserListScreen(),
        ),
        GoRoute(
          path: '/Bookings',
          name: AppRoute.bookingsListScreen,
            builder: (BuildContext context, GoRouterState state) => BookingScreen(),
            routes: [
              GoRoute(
                path: ':id',
                name: AppRoute.bookingDetailsScreen,
                builder: (BuildContext context, GoRouterState state) {
                  print("state. ${state.pathParameters}");
                  return BookingDetailsScreen(state.pathParameters['id']);
                },
              )
            ]
        ),
        GoRoute(
          path: '/Owners',
          name: AppRoute.ownerListScreen,
          builder: (BuildContext context,GoRouterState state) => OwnerListScreen(),

        ),
        GoRoute(
          path: '/Venues',
          name: AppRoute.venueListScreen,
          builder: (BuildContext context,GoRouterState state) => VenueListScreen(),
          routes: [
            GoRoute(
              path: ':id',
              name: AppRoute.venueDetailsScreen,
              builder: (BuildContext context,GoRouterState state) {
                print("state.uri.queryParameters ${state.pathParameters}");
                return VenueDetails(state.pathParameters['id']);
              },

            ),
          ]


        ),
        ShellRoute(
          builder: (context, state, child) {
            return OrganizationRootScreen(path: state.fullPath,child: child);
          },
          routes: [
            GoRoute(
                path: '/Organization',
                builder: (context, state) {
                  return SettingsScreen();
                },
                name: AppRoute.appSettingsScreen
            ),
            GoRoute(
                path: '/ConvenienceFeesScreen',
                name: AppRoute.convenienceFeesScreen,
                builder: (BuildContext context,GoRouterState state) => ConvenienceScreen()
            ),
            GoRoute(
              path: '/CouponListScreen',
              name: AppRoute.couponListScreen,
              builder: (BuildContext context,GoRouterState state) => CouponListScreen(),
            ),

          ],
        )

      ],
    ),

    // GoRoute(
    //   path: '/UserList',
    //   name: AppRoute.userListScreen,
    //   builder: (BuildContext context,GoRouterState state) => UserListScreen(),
    // )


  ],
);
