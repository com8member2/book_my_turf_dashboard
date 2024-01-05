import 'dart:convert';
import 'dart:developer';

import 'package:book_my_turf_dashboard/consatant/ColorConstant.dart';
import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/routing/go_app_routes.dart';
import 'package:book_my_turf_dashboard/shared/no_internet_screen.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_no_internet_widget/flutter_no_internet_widget.dart';
import 'package:hive/hive.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paged_datatable/l10n/generated/l10n.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


import 'consatant/Constants.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const secureStorage = FlutterSecureStorage();
  final encryptionKeyString = await secureStorage.read(key: 'key');
  if (encryptionKeyString == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  log('key: ' + (key.toString()));

   HiveLocalStorage.encryptionKey = key;
   await Supabase.initialize(
    url: "https://vknomtfmqlwordnhnsjm.supabase.co",
    anonKey:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrbm9tdGZtcWx3b3Jkbmhuc2ptIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk3NzEyNjUsImV4cCI6MjAwNTM0NzI2NX0.0S3Ct4aWX7ZuNU_KLIgOMmeSYzbNeNF1gfsXf1mNsVM",
  );
   runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});




  @override
  Widget build(BuildContext context,ref) {

    useEffect(() {

      getSharedPreference().then(
            (value) {
              if(value.getBool(PrefKeys.isDarkTheme)==null){
            isDarktheme.value = WidgetsBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
          }
          else{
            isDarktheme.value = value.getBool(PrefKeys.isDarkTheme,)!;
          }
        },
      );

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

      });

      EasyLoading.instance.maskType = EasyLoadingMaskType.black;
      EasyLoading.instance.indicatorType = EasyLoadingIndicatorType.pulse;
      return null;
    });

    return ValueListenableBuilder(
      valueListenable: isDarktheme,
      builder: (context, isDarkThemVal, child) {
        return MaterialApp.router(
          //initialRoute: Constants.supabase.auth.currentUser?.id !=null ? AppRoute.rootScreen : AppRoute.loginScreen,
          routerConfig: router,
          //routes: AppRoute.routes,
          scrollBehavior: CustomScrollBehavior(),
          debugShowCheckedModeBanner: false,
          title: 'Book For Sport Dashboard',
          themeMode: isDarkThemVal ? ThemeMode.dark:ThemeMode.light,
          localizationsDelegates: [PagedDataTableLocalization.delegate],
          builder: EasyLoading.init(
              builder: (context, child) =>
              child ?? SizedBox()
          ),
          darkTheme: FlexThemeData.dark(useMaterial3: true, scheme: FlexScheme.green),
          theme: FlexThemeData.light(useMaterial3: true, scheme: FlexScheme.greenM3,primary: CustomColor.primaryGreen),
        );
      },
    );
  }
}
