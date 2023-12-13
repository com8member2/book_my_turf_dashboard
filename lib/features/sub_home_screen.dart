import 'package:beamer/beamer.dart';
import 'package:book_my_turf_dashboard/location.dart';
import 'package:book_my_turf_dashboard/shared/widget/custom_image_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../btn.dart';

class SubHome extends HookConsumerWidget {



  SubHome();

  final _beamerKey = GlobalKey<BeamerState>();

  @override
  Widget build(BuildContext context,ref) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: CustomImageView(imagePath: "assets/images/splash_dark_logo (1).png",height: 250,),
        ),
      ),
      body: Row(
        children: [
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/home',
                  child: Text('Home'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/bookings',
                  child: Text('Bookings'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/venueList',
                  child: Text('Venue'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/ownerList',
                  child: Text('Owner'),
                ),
                SizedBox(height: 16.0),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/userList',
                  child: Text('Users'),
                ),
                Spacer(),
                MenuButton(
                  beamer: _beamerKey,
                  uri: '/logOut',
                  child: Text('logOut'),
                ),
              ],
            ),
          ),
          Container(width: 1, color: Theme.of(context).colorScheme.primary.withOpacity(0.1),),
          if ((context.currentBeamLocation.state as BeamState).uri.path.isEmpty)
            Expanded(
              child: Container(
                child: Center(
                  child: Text('Home second'),
                ),
              ),
            )
          else
            Expanded(
              child: ClipRRect(
                child: Beamer(
                  key: _beamerKey,
                  routerDelegate: BeamerDelegate(
                    transitionDelegate: const NoAnimationTransitionDelegate(),
                    locationBuilder: (routeInformation, _) {

                      print("routeInformation ${routeInformation.uri.path}");
                      return routeInformation.location!.contains('home')
                          ? HomeLocation(routeInformation)
                          : routeInformation.location!.contains('venueList')
                              ? VenueListLocation(routeInformation)
                              : routeInformation.location.contains('ownerList')
                                  ? OwnerListLocation(routeInformation)
                                  : routeInformation.location.contains('userList')
                                      ? UserListLocation(routeInformation)
                                      : BookingsLocation(routeInformation);
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}