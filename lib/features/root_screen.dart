import 'package:book_my_turf_dashboard/consatant/ColorConstant.dart';
import 'package:book_my_turf_dashboard/features/home/settings/settings.dart';
import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ready/ready.dart';

import '../../../routing/app_routes.dart';
import '../consatant/Constants.dart';
import '../shared/widget/common_switch_for_change_theme.dart';
import '../utility/utility.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'home/booking/presentation/booking_screen.dart';
import 'home/home_screen.dart';
import 'home/organization/presentation/convenience_screen.dart';
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
                Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
              },);
            },);
            },
            title: Text('Logout'),
            leading: Icon(Icons.logout_rounded),
          )
        ],
        headers: (expansion) =>
            [DrawerHeader(child: Image.asset('assets/images/ground.png'))],
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
            label: 'App Settings',
            id: 'settings',
            icon: Icon(
              Icons.settings,
              size: 20,
            ),
          ),
          DashboardItem(
            builder: (parameters) => Text("Coupon"),
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

// class HomeScreen extends StatefulWidget {
//
//
//   const HomeScreen();
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(children: [
//         Padding(
//           padding: const EdgeInsets.only(top: 30,left: 25,right: 25,bottom: 10),
//           child: SizedBox(
//             width: 250,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 //titleImage(),
//                 Text("Book My Turf",style:  TextStyle(fontSize: 32,color: CustomColor.primaryGreen,fontWeight: FontWeight.w900),),
//                 Padding(
//                     padding: const EdgeInsets.only(top: 30.0, bottom: 15),
//                     child: ListTile(
//                       leading: Icon(
//                         Icons.dashboard_customize_rounded,
//                         size: 15,
//                       ),
//                       onTap: () {
//
//                         //context.goNamed(AppRoute.home);
//
//                       },
//                       title: Text("Home", style: TextStyle(fontSize: 14)),
//                     )),
//                 ExpansionTile(
//                   iconColor: CustomColor.primaryGreen,
//                   leading: Icon(Icons.group,size: 20,),
//                   title: Text('User',style: TextStyle(fontSize: 14),),
//                   childrenPadding: EdgeInsetsDirectional.zero,
//                   onExpansionChanged: (value) {
//                   },
//                   children: <Widget>[
//                     ListTile(title: Text('List',style: TextStyle(fontSize: 14),),
//                         onTap:() {
//                       //Navigator.pushNamed(context, AppRoute.userListScreen);
//                       context.goNamed(AppRoute.userListScreen);
//                     }),
//                   ],
//                 ),
//                 // Padding(
//                 //   padding: EdgeInsets.only(top: 10, bottom: 15),
//                 //   child: ExpansionTile(
//                 //     iconColor: CustomColor.primaryGreen,
//                 //     leading: Icon(
//                 //       Icons.man,
//                 //       size: 20,
//                 //     ),
//                 //     title: Text(
//                 //       'Owner',
//                 //       style: TextStyle(fontSize: 14),
//                 //     ),
//                 //     childrenPadding: EdgeInsetsDirectional.zero,
//                 //     onExpansionChanged: (value) {
//                 //       print("onexpan..........${value}");
//                 //     },
//                 //     children: <Widget>[
//                 //       ListTile(
//                 //           title: Text(
//                 //             'List',
//                 //             style: TextStyle(fontSize: 14),
//                 //           ),
//                 //           onTap: () {
//                 //             Navigator.pushNamed(context, AppRoute.userListScreen);
//                 //
//                 //             context.goNamed(AppRoute.home);
//                 //           }),
//                 //     ],
//                 //   ),
//                 // ),
//
//                 CommonSwitchForChangeTheme(),
//                 Spacer(),
//                 ActionChip(
//                   label: Text('Log Out'),
//                   onPressed: () {
//                     showConfirmationDialog(
//                       context,
//                       'Are you sure want to Logout?',
//                           () {
//                         Constants.supabase.auth.signOut().then(
//                               (value) {
//                                 Navigator.pushNamed(context, AppRoute.loginScreen);
//
//                                 //context.go(AppRoute.login);
//                           },
//                         );
//                       },
//                     );
//                   },
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//         // Expanded(child: widget.child)
//       ]),
//     );
//   }
//
// }
