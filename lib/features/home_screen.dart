import 'package:book_my_turf_dashboard/consatant/ColorConstant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../routing/app_routes.dart';
import '../consatant/Constants.dart';
import '../shared/widget/common_switch_for_change_theme.dart';
import '../utility/utility.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

// class HomeScreen extends HookConsumerWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return AdminScaffold(
//       body: SingleChildScrollView(child: Center(child: Text("Dashboard..."))),
//       sideBar: SideBar(
//         //backgroundColor: CustomColor.primaryGreen,
//         items: [
//           AdminMenuItem(title: 'Home', route: '/',icon: Icons.dashboard),
//           AdminMenuItem(title: 'Users',
//               icon: Icons.people,
//               children: [
//             AdminMenuItem(title: 'List', route: '/user_list'),
//           ]),
//           AdminMenuItem(title: 'Owner',
//               icon: Icons.people,
//               children: [
//                 AdminMenuItem(title: 'List', route: '/user_list'),
//               ])
//         ],
//         onSelected: (item) {
//           print("route .... ${item.route}");
//           if(item.route !=null){
//             Navigator.of(context).pushNamed(item.route!);
//           }
//         },
//         selectedRoute: '/',
//       ),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  final Widget child;
  final String path;

  const HomeScreen({super.key, required this.child, required this.path});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Padding(
          padding: const EdgeInsets.only(top: 30,left: 25,right: 25,bottom: 10),
          child: SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //titleImage(),
                Text("Book My Turf",style:  TextStyle(fontSize: 32,color: CustomColor.primaryGreen,fontWeight: FontWeight.w900),),
                Padding(
                    padding: const EdgeInsets.only(top: 30.0, bottom: 15),
                    child: ListTile(
                      leading: Icon(
                        Icons.dashboard_customize_rounded,
                        size: 15,
                      ),
                      onTap: () {

                        //context.goNamed(AppRoute.home);

                      },
                      title: Text("Home", style: TextStyle(fontSize: 14)),
                    )),
                ExpansionTile(
                  iconColor: CustomColor.primaryGreen,
                  leading: Icon(Icons.group,size: 20,),
                  title: Text('User',style: TextStyle(fontSize: 14),),
                  childrenPadding: EdgeInsetsDirectional.zero,
                  onExpansionChanged: (value) {
                  },
                  children: <Widget>[
                    ListTile(title: Text('List',style: TextStyle(fontSize: 14),),
                        onTap:() {
                      //Navigator.pushNamed(context, AppRoute.userListScreen);
                      context.goNamed(AppRoute.userListScreen);
                    }),
                  ],
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 10, bottom: 15),
                //   child: ExpansionTile(
                //     iconColor: CustomColor.primaryGreen,
                //     leading: Icon(
                //       Icons.man,
                //       size: 20,
                //     ),
                //     title: Text(
                //       'Owner',
                //       style: TextStyle(fontSize: 14),
                //     ),
                //     childrenPadding: EdgeInsetsDirectional.zero,
                //     onExpansionChanged: (value) {
                //       print("onexpan..........${value}");
                //     },
                //     children: <Widget>[
                //       ListTile(
                //           title: Text(
                //             'List',
                //             style: TextStyle(fontSize: 14),
                //           ),
                //           onTap: () {
                //             Navigator.pushNamed(context, AppRoute.userListScreen);
                //
                //             context.goNamed(AppRoute.home);
                //           }),
                //     ],
                //   ),
                // ),

                CommonSwitchForChangeTheme(),
                Spacer(),
                ActionChip(
                  label: Text('Log Out'),
                  onPressed: () {
                    showConfirmationDialog(
                      context,
                      'Are you sure want to Logout?',
                          () {
                        Constants.supabase.auth.signOut().then(
                              (value) {
                                Navigator.pushNamed(context, AppRoute.loginScreen);

                                //context.go(AppRoute.login);
                          },
                        );
                      },
                    );
                  },
                ),

              ],
            ),
          ),
        ),
        Expanded(child: widget.child)
      ]),
    );
  }

}
