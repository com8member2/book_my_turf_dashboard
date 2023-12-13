import 'package:beamer/beamer.dart';
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




    return Scaffold(
      body: Column(children: [
        ListTile(
          title: Text("Home"),
          onTap: () {
            context.beamToNamed(AppRoute.homeScreen);
          },
        ),
        ListTile(
          title: Text("Booking"),
          onTap: () {
            context.beamToNamed(AppRoute.bookingsListScreen);
          },
        )
      ]),
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
