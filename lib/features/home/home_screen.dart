import 'package:book_my_turf_dashboard/features/home/owner/controller/owner_controller.dart';
import 'package:book_my_turf_dashboard/features/home/user/controller/user_controller.dart';
import 'package:book_my_turf_dashboard/features/home/venues/controller/venue_controller.dart';
import 'package:book_my_turf_dashboard/shared/widget/common_switch_for_change_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../shared/widget/custom_image_view.dart';
import '../../utility/utility.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allUsers = ref.watch(getAllUsersProvider);
    var allOwners = ref.watch(getAllOwnersProvider);
    var allVenues = ref.watch(getAllVenuesProvider);


    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, right: 30, left: 30, bottom: 20),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
           allUsers.when(data: (allUserList) {return  Flexible(
               flex: 2,
               child: Column(
                 children: [
                   Card(
                     color: Theme.of(context).cardColor,

                     child: Padding(
                       padding: const EdgeInsets.only(left: 15.0, right: 100, top: 15, bottom: 15),
                       child: Row(
                         children: [
                           CustomImageView(
                             imagePath: "assets/images/profile.png",
                             height: 50,
                             width: 50,
                           ),
                           Padding(
                             padding: const EdgeInsets.only(left: 15.0),
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Text(
                                   '${allUserList.length}',
                                   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                 ),
                                 const Text('Total User', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
                               ],
                             ),
                           )
                         ],
                       ),
                     ),
                   ),
                 ],
               ),
             );}, error: (error, stackTrace) => Text(error.toString()), loading: () => SizedBox(),),
            allOwners.when(data: (allOwnersList) {
                  return Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Card(
                          color: Theme.of(context).cardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 100, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: "assets/images/profile.png",
                                  height: 50,
                                  width: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${allOwnersList.length}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      const Text('Total Owners',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }, error: (error, stackTrace) => Text(error.toString()), loading: () => SizedBox(),),
            allVenues.when(data: (allVenuesList) {
                  return Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Card(
                          color: Theme.of(context).cardColor,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 100, top: 15, bottom: 15),
                            child: Row(
                              children: [
                                CustomImageView(
                                  imagePath: "assets/images/profile.png",
                                  height: 50,
                                  width: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${allVenuesList.length}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24),
                                      ),
                                      const Text('Total Venues',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }, error: (error, stackTrace) => Text(error.toString()), loading: () => SizedBox(),),
            ],
        )
      ),
    );
  }
}
