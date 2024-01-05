import 'dart:developer';

import 'package:book_my_turf_dashboard/model/venue_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../consatant/Constants.dart';

part 'venue_controller.g.dart';

@riverpod
Future<List> getTurfs(GetTurfsRef ref,id) async {
  var list = await Constants.supabase.from(SupaTables.turf_list).select().eq('vanue_id', id);
  return list;
}

@riverpod
Future<List> getStaff(GetStaffRef ref,id) async {
  List venueIDs = await Constants.supabase
      .from(SupaTables.owner_role)
      .select("*,role!inner(*)")
      .eq("venue_id", id);

  List list = await Constants.supabase.from(SupaTables.owner_role).select("*,role(role_name,id),${SupaTables.owner_profile}(name,phone,email)").
  in_('owner_id', venueIDs.map((e) => e['owner_id'],).toList()).is_('${SupaTables.owner_profile}.deletaed_at', null);

  return list;
}

@riverpod
Future<List> getAllVenues(GetAllVenuesRef ref) async {
  var list = await Constants.supabase.from(SupaTables.venue_list).select();
  return list;
}

@riverpod
class venueSearchValue extends _$venueSearchValue {
  @override
  String build() {
    ref.keepAlive();
    return '';
  }
}

@riverpod
class venueCitySearchValue extends _$venueCitySearchValue {
  @override
  String build() {
    ref.keepAlive();
    return '';
  }
}

@riverpod
Future<VenueEntity> getVenueDetails(GetVenueDetailsRef ref, id) async {

  List list = await Constants.supabase
      .from(SupaTables.venue_list)
      .select().eq('id', id);

  return VenueEntity.fromJson(list[0]);
}