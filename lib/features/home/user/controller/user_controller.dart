import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../consatant/Constants.dart';

part 'user_controller.g.dart';

@riverpod
Future<List> getAllUsers(GetAllUsersRef ref) async {
  var list = await Constants.supabase.from(SupaTables.user_profile).select().is_('deletaed_at', null);
  return list;
}

@riverpod
class userSearchValue extends _$userSearchValue {
  @override
  String build() => '';
}