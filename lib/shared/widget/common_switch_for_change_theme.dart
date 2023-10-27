import 'package:book_my_turf_dashboard/consatant/ColorConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../utility/utility.dart';
import 'custom_image_view.dart';

class CommonSwitchForChangeTheme extends HookConsumerWidget {
  const CommonSwitchForChangeTheme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: isDarktheme,
      builder: (context, isDarkThemeVal, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: ListTile(
              onTap: () {
                isDarktheme.value = !isDarkThemeVal;
              },
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.only(top: 3, bottom: 3, left: 15, right: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              leading: Icon(Icons.dark_mode),
              trailing:Switch(
              onChanged: (value) => changeTheme(value, context),
        value: isDarkThemeVal,
        activeColor: CustomColor.primaryGreen,
        ),),
        );
      },
    );
  }
}
