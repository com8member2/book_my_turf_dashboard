import 'package:book_my_turf_dashboard/consatant/Constants.dart';
import 'package:book_my_turf_dashboard/shared/widget/shared_small_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../model/venue_entity.dart';
import '../../../../shared/widget/custom_image_view.dart';
import '../../../../utility/utility.dart';
import '../controller/booking_controller.dart';

class BookingDetailsScreen extends HookConsumerWidget {
  final editItem;

  const BookingDetailsScreen(this.editItem);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print("staffList ${staffList}");

    var selectedItem = useState<String>(editItem['status'] ?? BookingStatus.pending.value);

    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Text("Booking Price : ${editItem['price'].toString()}"),
          Padding(
            padding: EdgeInsets.only(top: 25, bottom: 25),
            child:
                ref.watch(getAllBookingUsersProvider(editItem['user_id'])).when(
                      data: (data) {
                        return Text("User Name : ${data[0]['name']}");
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => SizedBox(),
                    ),
          ),
          ref.watch(getAllBookingVenueProvider(editItem['venue_id'])).when(
                data: (data) {
                  return Text("Venue Name : ${data[0]['venue_name']}");
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => SizedBox(),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0,bottom: 25),
            child: Row(
              children: [
                Text("Change Status : "),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 150,
                  child: DropdownButtonFormField(
                    decoration: dropDownDecoration('Status', context),
                    value: selectedItem.value,
                    onChanged: (String? newValue) async {
                      if (newValue != null) {
                        selectedItem.value = newValue;
                        await Constants.supabase.from(SupaTables.bookings).update({'status' : selectedItem.value}).match({'id' : editItem['id']});
                      }
                    },
                    items: [
                      BookingStatus.rejected.value,
                      BookingStatus.booked.value,
                      BookingStatus.completed.value,
                      BookingStatus.pending.value
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 16),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
              Text("Date : ${editItem['date'].toString().replaceAll("[", "").replaceAll("]", "")}")
        ]),
      ),
    );
  }
}
