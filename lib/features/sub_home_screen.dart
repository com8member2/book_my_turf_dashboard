import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../routing/app_routes.dart';
import '../../../shared/widget/common_switch_for_change_theme.dart';
import '../consatant/Constants.dart';
import '../routing/go_app_routes.dart';
import '../shared/widget/custom_image_view.dart';
import '../utility/utility.dart';

class SubHomeScreen extends StatefulWidget {
  final Widget child;
  final String path;

  const SubHomeScreen({super.key, required this.child, required this.path});

  @override
  State<SubHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<SubHomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 150,
              child: Theme(
                data: Theme.of(context).copyWith(chipTheme: ChipThemeData(
                        selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                        labelStyle: Theme.of(context).textTheme.titleMedium)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageView(imagePath: isDarktheme.value ? 'assets/images/splash_dark_logo (1).png' : "assets/images/splash_light_logo (1).png",),
                    ChoiceChip.elevated(
                      showCheckmark: false,
                      avatar: Icon(Icons.space_dashboard_rounded, color: Theme.of(context).colorScheme.primary, size: 23),
                      selected: widget.path == '/Home',
                      onSelected: (value) {
                        if (value) {
                          context.goNamed(AppRoute.home);
                        }
                      },
                      label: Text('Home'),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 8.0),
                      child: ChoiceChip.elevated(
                        showCheckmark: false,
                        avatar: Icon(Icons.self_improvement_rounded, color: Theme.of(context).colorScheme.primary, size: 23),
                        selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                        selected: widget.path.contains('/Users'),
                        onSelected: (value) {
                          print("do mkmsd ---- ${value}");
                          if (value) {
                            context.goNamed(AppRoute.userListScreen);
                          }
                        },
                        label: Text('Users'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ChoiceChip.elevated(
                        showCheckmark: false,
                        avatar: Icon(Icons.book, color: Theme.of(context).colorScheme.primary, size: 23),
                        selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                        selected: widget.path.contains('/Bookings'),
                        onSelected: (value) {
                          if (value) {
                            context.goNamed(AppRoute.bookingsListScreen);
                          }
                        },
                        label: Text('Booking'),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ChoiceChip.elevated(
                        showCheckmark: false,
                        avatar: Icon(Icons.group, color: Theme.of(context).colorScheme.primary, size: 23),
                        selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                        selected: widget.path.contains('/Owners'),
                        onSelected: (value) {
                          if (value) {
                            context.goNamed(AppRoute.ownerListScreen);
                          }
                        },
                        label: Text('Owners'),
                      ),
                    ),
                    ChoiceChip.elevated(
                      showCheckmark: false,
                      avatar: Icon(Icons.group_work_rounded, color: Theme.of(context).colorScheme.primary, size: 23),
                      selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                      selected: widget.path.contains('/Venues'),
                      onSelected: (value) {
                        if (value) {
                          context.goNamed(AppRoute.venueListScreen);
                        }
                      },
                      label: Text('Venues'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ChoiceChip.elevated(
                        showCheckmark: false,
                        avatar: Icon(Icons.people_alt_rounded, color: Theme.of(context).colorScheme.primary, size: 23),
                        selectedColor: Theme.of(context).colorScheme.onBackground.withOpacity(0.1),
                        selected: widget.path.contains('/Organization'),
                        onSelected: (value) {
                          if (value) {
                            context.goNamed(AppRoute.appSettingsScreen);
                          }
                        },
                        label: Text('Organization'),
                      ),
                    ),

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
                                context.go(AppRoute.login);
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
          ),
        ),
        Expanded(child: widget.child)
      ]),
    );
  }

}
