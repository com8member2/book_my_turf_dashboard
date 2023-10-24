import 'dart:convert';
import 'dart:developer';


import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paged_datatable/l10n/generated/l10n.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'consatant/Constants.dart';
import 'firebase_options.dart';


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

  // HiveLocalStorage.encryptionKey = key;
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  //await Constants.remoteConfig.fetchAndActivate();
  await Supabase.initialize(
    url: "https://vknomtfmqlwordnhnsjm.supabase.co",
    anonKey:
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZrbm9tdGZtcWx3b3Jkbmhuc2ptIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODk3NzEyNjUsImV4cCI6MjAwNTM0NzI2NX0.0S3Ct4aWX7ZuNU_KLIgOMmeSYzbNeNF1gfsXf1mNsVM",
  );

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarktheme,
      builder: (context, isDarkThemVal, child) {
        return MaterialApp(
          initialRoute: AppRoutes.loginScreen,
          routes: AppRoutes.routes,
          //routerConfig: router,
          debugShowCheckedModeBanner: false,
          title: 'Book My Turf Dashboard',
          themeMode: isDarkThemVal ? ThemeMode.dark:ThemeMode.light,
          localizationsDelegates: [PagedDataTableLocalization.delegate],
          builder: EasyLoading.init(
              builder: (context, child) =>
              child ??
                  SizedBox()
          ),
          darkTheme: FlexThemeData.dark(useMaterial3: true, scheme: FlexScheme.vesuviusBurn),
          theme: FlexThemeData.light(useMaterial3: true, scheme: FlexScheme.vesuviusBurn),
        );
      },
    );
  }
}
