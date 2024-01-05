import 'dart:developer';

import 'package:book_my_turf_dashboard/model/booking_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../consatant/Constants.dart';

part 'booking_controller.g.dart';

@riverpod
Future<List> getAllBookingVenue(GetAllBookingVenueRef ref,id) async {
  List list = await Constants.supabase
      .from(SupaTables.venue_list)
      .select("venue_name").eq('id', id);

  return list;
}
@riverpod
class BookingDetailsController extends _$BookingDetailsController {
  @override
  Future<Map> build(id) async {
    return await Constants.supabase
        .from(SupaTables.bookings)
        .select('*,${SupaTables.user_profile}(*),${SupaTables.venue_list}(*,${SupaTables.turf_list}(*)),${SupaTables.bookingSlots}(*)')
        .eq('id', id)
        .single();
  }
}