import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../consatant/Constants.dart';

part 'owner_controller.g.dart';

@riverpod
Future<List> getAllOwners(GetAllOwnersRef ref) async {
  var list = await Constants.supabase.from(SupaTables.owner_profile).select();
  return list;
}

@riverpod
class ownerSearchValue extends _$ownerSearchValue {
  @override
  String build() => '';
}