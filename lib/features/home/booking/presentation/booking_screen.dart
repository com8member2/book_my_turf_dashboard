import 'dart:async';
import 'dart:developer';

import 'package:book_my_turf_dashboard/features/home/booking/controller/booking_controller.dart';
import 'package:book_my_turf_dashboard/features/home/booking/presentation/booking_details_screen.dart';
import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_details_screen.dart';
import 'package:book_my_turf_dashboard/model/booking_entity.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paged_datatable/paged_datatable.dart';
import '../../../../consatant/ColorConstant.dart';
import '../../../../consatant/Constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../model/venue_entity.dart';
import '../../../../routing/go_app_routes.dart';
import '../../../../shared/widget/shared_small_widgets.dart';


class BookingScreen extends HookConsumerWidget {

  BookingScreen({super.key});

  var controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);
    var sizeFactor = 0.20;

    var txtController = useTextEditingController();
    var cityController = useTextEditingController();
    var selectedCityList = useState([]);

    useEffect(() {
      controller = PagedDataTableController<int, Map<dynamic, dynamic>>();
    },);

    return  PagedDataTable<int, Map>(
      // filters: [TextTableFilter(chipFormatter: (value) => 'By $value', id: 'name', title: 'Trainer\'s Name')],TODO pending
      controller: controller,
      theme: PagedDataTableThemeData(
          configuration:  PagedDataTableConfiguration(pageSizes: [10,20,50,100],initialPageSize: 10,filterBarHeight: selectedCityList.value.isEmpty ? 120 : 250),
          footerTextStyle: Theme.of(context).textTheme.bodyMedium,
          headerTextStyle: Theme.of(context).textTheme.titleLarge,
          rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
          dividerColor: Theme.of(context).secondaryHeaderColor,
          border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText),
      fetchPage: (pageToken, pageSize, sortBy, filtering) async {

        var bookingList;

        bookingList = await Constants.supabase.from(SupaTables.bookings).select().range(pageToken, pageToken + pageSize);

        return PaginationResult.items(elements: [...bookingList as List], nextPageToken: (bookingList).length < pageSize  ? null : pageToken + pageSize, size: (bookingList as List).length);
      },
      initialPage: 0,
      columns: [
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'User Name',
          cellBuilder: (p0) {
            
             if(p0['user_id'] !=null) {
               return ref.watch(getAllBookingUsersProvider(p0['user_id'],)).when(data: (data) {
                 return Text("${data[0]['name']}");
               }, error: (error, stackTrace) => Text(error.toString()), loading: () => SizedBox(),);
             }
             else{
               return Text(p0['user_name']);
             }
           
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Venue Name',
          cellBuilder: (p0) {
            return ref.watch(getAllBookingVenueProvider(p0['venue_id'])).when(data: (data) {
              return Text("${data[0]['venue_name']}");
            }, error: (error, stackTrace) => Text(error.toString()), loading: () => SizedBox(),);
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Price',
          cellBuilder: (p0) {
            return Text("${p0['price']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Status',
          cellBuilder: (p0) {
            return Text("${p0['status']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'View Details',
          cellBuilder: (p0) => IconButton(
              onPressed: () {
                var map = Map<String, dynamic>.from(p0);
                print("in booking screen ${map.map((key, value) => MapEntry(key.toString(), value.toString()))}");

                print("mapmapmapmapmapmap ${map['id']}");
                context.goNamed(AppRoute.bookingDetailsScreen,
                    pathParameters: {'id' : map['id'].toString()});
              },
              icon: Icon(Icons.edit_note_rounded)),
        ),
      ],

    ) ;
  }
}

