import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../consatant/Constants.dart';

part 'booking_controller.g.dart';

@riverpod
Future<List> getAllBookingUsers(GetAllBookingUsersRef ref,id) async {
  List list = await Constants.supabase
      .from(SupaTables.user_profile)
      .select("name").eq('id', id);

  return list;
}

@riverpod
Future<List> getAllBookingVenue(GetAllBookingVenueRef ref,id) async {
  List list = await Constants.supabase
      .from(SupaTables.venue_list)
      .select("venue_name").eq('id', id);

  return list;
}

@riverpod
Future<List> getBookingTurf(GetBookingTurfRef ref,List id) async {

  List list = await Constants.supabase
      .from(SupaTables.turf_list)
      .select().in_('id', id.map((e) => e).toList());

  return list;
}