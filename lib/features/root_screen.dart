import 'package:book_my_turf_dashboard/consatant/ColorConstant.dart';
import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:ready/ready.dart';

import '../../../routing/app_routes.dart';
import '../consatant/Constants.dart';
import '../shared/widget/common_switch_for_change_theme.dart';
import '../utility/utility.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'home/booking/presentation/booking_screen.dart';
import 'home/home_screen.dart';
import 'home/organization/conveniencefees/presentation/convenience_screen.dart';
import 'home/organization/coupn/presentation/coupn_list_screen.dart';
import 'home/organization/settings/settings.dart';
import 'home/owner/presentation/owner_list_screen.dart';
import 'home/user/presentation/user_list_screen.dart';
import 'home/venues/presentation/venue_list_screen.dart';

class RootScreen extends HookConsumerWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {




    return ReadyDashboard(
      iconsWhenCollapsedInDesktop: true,
      appBarOptions: (phone) => AppBarOptions(
        snap: false,
        inputDecoration: (loading) => InputDecoration(),
        floating: false,
      ),
      drawerOptions: (phone) => DrawerOptions(
        footer: (expansion) => [
          ListTile(
            onTap: () async {
            showConfirmationDialog(context, 'Are you sure want to Logout?', ()  {
               Constants.supabase.auth.signOut().then((value) {
                Navigator.pushReplacementNamed(context, AAppRoute.loginScreen);
              },);
            },);
            },
            title: Text('Logout'),
            leading: Icon(Icons.logout_rounded),
          )
        ],
        headers: (expansion) =>
            [
              DrawerHeader(child: CustomImageView(imagePath: isDarktheme.value ? 'assets/images/splash_dark_logo (1).png' : "assets/images/splash_light_logo (1).png",))],
        //backgroundColor: CustomColor.lightGreen,
      ),
      items: [
        DashboardItem(
          builder: (parameters) => HomeScreen(),
          label: 'Home',

          id: 'home',
          icon: Icon(
            Icons.dashboard,
            size: 20,
          ),
        ),

        DashboardItem(
          builder: (parameters) => BookingScreen(),
          label: 'Bookings',
          id: 'booking',
          icon: Icon(
            Icons.list_alt_rounded,
            size: 20,
          ),
        ),
        DashboardItem(
          builder: (parameters) => UserListScreen(),
          label: 'User ',
          id: 'user',
          icon: Icon(Icons.groups),
        ),
        DashboardItem(
          builder: (parameters) => OwnerListScreen(),
          label: 'Owner ',
          id: 'owner',
          icon: Icon(Icons.people),
        ),
        DashboardItem(
          builder: (parameters) => VenueListScreen(),
          label: 'Venue ',
          id: 'venue',
          icon: Icon(Icons.sports_basketball),
        ),
        DashboardItem.items(
         // builder: (parameters) => VenueListScreen(),
          label: 'Organization ',
        // id: 'organization',
          icon: CustomImageView(imagePath: 'assets/images/org.png',height: 22,width: 22,), subItems: [
          DashboardItem(
            builder: (parameters) =>  SettingsScreen(),
            label: 'App Setting',
            id: 'settings',
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
          ),
          DashboardItem(
            builder: (parameters) => CouponListScreen(),
            label: 'Coupon ',
            id: 'coupon',
            icon: Icon(Icons.card_membership),
          ),
          DashboardItem(
            builder: (parameters) => ConvenienceScreen(),
            label: 'Convenience fees ',
            id: 'convenience',
            icon: Icon(Icons.currency_rupee),
          ),
        ],
        ),
      ],
    );
  }
}

