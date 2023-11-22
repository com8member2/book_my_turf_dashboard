import 'package:book_my_turf_dashboard/features/home/owner/controller/owner_controller.dart';
import 'package:book_my_turf_dashboard/features/home/user/controller/user_controller.dart';
import 'package:book_my_turf_dashboard/features/home/venues/controller/venue_controller.dart';
import 'package:book_my_turf_dashboard/shared/widget/common_switch_for_change_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {



    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 30, left: 30, bottom: 20),
          child: Column(children: [
            SizedBox(width:150,child: CommonSwitchForChangeTheme())
          ],)
      ),
    );
  }
}
