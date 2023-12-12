import 'package:book_my_turf_dashboard/model/booking_entity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../consatant/Constants.dart';
import '../consatant/ColorConstant.dart';

BoxDecoration shadow(BuildContext context, [Color? scaffoldBackgroundColor]) {
  return BoxDecoration(
    color: CustomColor.white,
    boxShadow: [
      BoxShadow(
          spreadRadius: 0.2,
          blurRadius: 20,
          color: CustomColor.txtDarkGray.withOpacity(0.2),
          offset: const Offset(0, 0))
    ],
  );
}


SharedPreferences? pref;
final isDarktheme = ValueNotifier(WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark);

Future<SharedPreferences> getSharedPreference() async {
  return pref ??= await SharedPreferences.getInstance();
}

// SupabaseClient getAdminSupabase(){
//   final supabase = SupabaseClient(Constants.supabaseUrl, Constants.remoteConfig.getValue('service_role').asString());
//   return supabase;
// }

Future<void> changeTheme(bool themeValue, BuildContext context) async {
  isDarktheme.value = themeValue;
  await getSharedPreference().then((value) {
    value.setBool(PrefKeys.isDarkTheme, themeValue);
  },);
}
Image titleImage() => Image.asset(isDarktheme.value ? 'assets/images/splash_dark_logo (1).png' : 'assets/images/splash_light_logo (1).png',height: 80,);

InputDecoration textFieldDecorationForProfile(String hint, BuildContext context, {bool isColorBorder = false}) {
  final outlineInputBorder = isColorBorder
      ? OutlineInputBorder(
      borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1), borderRadius: BorderRadius.all(Radius.circular(12)))
      : OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent, width: 0), borderRadius: BorderRadius.all(Radius.circular(12)));
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    filled: true,
    hintText: hint,
    counterText: "",
    fillColor: Theme.of(context).cardColor,
    hintStyle: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.4)),
    border: outlineInputBorder,
    disabledBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
  );
}

// void showError(String title, String description) {
//   ElegantNotification.error(
//     background: Theme.of(rootNavigatorKey.currentContext!).colorScheme.surface,
//     width: 360,
//     notificationPosition: NotificationPosition.topRight,
//     animation: AnimationType.fromRight,
//     title: Text(title),
//     description: Text(description),
//   ).show(rootNavigatorKey.currentContext!);
// }
//
// void showSuccess(String title, String description) {
//   ElegantNotification.success(
//     background: Theme.of(rootNavigatorKey.currentContext!).colorScheme.surface,
//     width: 360,
//     notificationPosition: NotificationPosition.topRight,
//     animation: AnimationType.fromRight,
//     title: Text(title),
//     description: Text(description),
//   ).show(rootNavigatorKey.currentContext!);
// }

// void showInfo(String title, String description) {
//   ElegantNotification.info(
//     background: Theme.of(rootNavigatorKey.currentContext!).colorScheme.surface,
//     width: 360,
//     notificationPosition: NotificationPosition.topRight,
//     animation: AnimationType.fromRight,
//     title: Text(title),
//     description: Text(description),
//   ).show(rootNavigatorKey.currentContext!);
// }

void showConfirmationDialog(
    context,
    String title,
    Null Function() param1,
    ) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(content: Text(title), actions: [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel')),
      TextButton(
        onPressed: () {
          param1();
          Navigator.pop(context);
        },
        child: const Text("Sure"),
      )
    ]),
  );
}



void showExportFileOptionsDialog(
    context,
    Null Function() pdf,
    Null Function() excel,
    ) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(content: Text("Do you want to download the data as PDF or Excel?"), actions: [
      TextButton(
          onPressed: () {
            pdf();
            Navigator.pop(context);
          },
          child: const Text('PDF')),
      TextButton(
        onPressed: () {
          excel();
          Navigator.pop(context);
        },
        child: const Text("Excel"),
      )
    ]),
  );
}

String extractcountryCode(String input, {bool? isCountry = false}) {
  int spaceIndex = input.indexOf(" ");
  if (spaceIndex != -1 && isCountry == false) {
    return input.substring(0, spaceIndex);
  } else if (spaceIndex != -1 && isCountry == true) {
    return input.substring(spaceIndex + 1);
  }
  return "";
}
InputDecoration dropDownDecoration(String hint,BuildContext context,{bool isColorBorder = false}) {
  const outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: CustomColor.txtMediumGray,width: 0.5), borderRadius: BorderRadius.all(Radius.circular(5)));
  return InputDecoration(

    contentPadding: const EdgeInsets.only(top: 5, bottom: 5, right: 10, left: 12),
    hintText: hint,
    isDense: true,
    fillColor: Theme.of(context).cardColor,
    hintStyle: const TextStyle(fontSize: 12),
    border:outlineInputBorder ,
    disabledBorder: outlineInputBorder,
    enabledBorder: outlineInputBorder,
    focusedBorder: isColorBorder ? OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).primaryColor,width: 1), borderRadius: const BorderRadius.all(Radius.circular(8))) : outlineInputBorder,

  );
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
bool hasNumber(String input) {
  // Regular expression to check if the string contains a number
  final RegExp regex = RegExp(r'\d');
  return regex.hasMatch(input);
}

bool hasOnlyLetters(String input) {
  // Regular expression to check if the string consists entirely of letters
  final RegExp regex = RegExp(r'^[a-zA-Z]+$');
  return regex.hasMatch(input);
}
