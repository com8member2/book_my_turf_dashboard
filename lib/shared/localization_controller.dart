import 'dart:ui';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_controller.g.dart';

@riverpod
class Localization extends _$Localization {
  @override
  Locale build() {
    return Locale('en');
  }

  update(String languageCode){
    state = Locale(languageCode);
  }
}
