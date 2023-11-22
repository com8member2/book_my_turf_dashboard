import 'dart:developer';

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
  in_('owner_id', venueIDs.map((e) => e['owner_id'],).toList());

  return list;
}


@riverpod
Future<List> getAllVenuesCity(GetAllVenuesCityRef ref)  async {
  var cities;
  List list =  await Constants.supabase.from(SupaTables.venue_list).select('city');
  cities = list.map((e) =>  e['city']).toSet().toList();
  print("city set ${cities}");
  return cities;
}

@riverpod
Future<List> getAllVenues(GetAllVenuesRef ref) async {
  var list = await Constants.supabase.from(SupaTables.venue_list).select();
  return list;
}

@riverpod
class venueSearchValue extends _$venueSearchValue {
  @override
  String build() => '';
}