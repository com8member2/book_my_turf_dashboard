import 'dart:async';
import 'dart:developer';

import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_details_screen.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:paged_datatable/paged_datatable.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../../consatant/ColorConstant.dart';
import '../../../../consatant/Constants.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../model/venue_entity.dart';
import '../../../../shared/widget/shared_small_widgets.dart';
import '../controller/venue_controller.dart';

class VenueListScreen extends HookConsumerWidget {

  VenueListScreen({super.key});

  late final VenueDataSource? venueDataSource;
  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);
    var cities = ref.watch(getAllVenuesCityProvider);
    var sizeFactor = 0.1;

    var txtController = useTextEditingController();



    return cities.when(data: (cityList) {

      return PagedDataTable<int, Map>(
        // filters: [TextTableFilter(chipFormatter: (value) => 'By $value', id: 'name', title: 'Trainer\'s Name')],TODO pending
        controller: controller,
        theme: PagedDataTableThemeData(
            configuration: const PagedDataTableConfiguration(pageSizes: [10,20,50,100],initialPageSize: 10),
            footerTextStyle: Theme.of(context).textTheme.bodyMedium,
            headerTextStyle: Theme.of(context).textTheme.titleLarge,
            rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
            dividerColor: Theme.of(context).secondaryHeaderColor,
            border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
            backgroundColor: Theme.of(context).colorScheme.background,
            textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText),
        fetchPage: (pageToken, pageSize, sortBy, filtering) async {

          var venueList;

          if(ref.read(venueSearchValueProvider).isNotEmpty)
          {
            venueList = await Constants.supabase.from(SupaTables.venue_list).select().ilike('venue_name', "%${ref.read(venueSearchValueProvider)}%").range(pageToken, pageToken + pageSize);
            //venueList = await Constants.supabase.from(SupaTables.venue_list).select().ilike('venue_name', "%${ref.read(venueSearchValueProvider)}%").or('city.ilike.%${ref.read(venueSearchValueProvider)}%').range(pageToken, pageToken + pageSize);
            // users = await Constants.supabase
            //     .from(SupaTables.user_profile)
            //     .select()
            //     .or('first_name.eq.${filtering.valueOrNull('name')},last_name.eq.${filtering.valueOrNull('name')}').range(pageToken, pageToken + pageSize);;
           // venueList = await Constants.supabase.from(SupaTables.venue_list).
          }
          else
          {
            venueList = await Constants.supabase.from(SupaTables.venue_list).select().range(pageToken, pageToken + pageSize);
          }
          return PaginationResult.items(elements: [...venueList as List], nextPageToken: (venueList as List).length < pageSize  ? null : pageToken + pageSize, size: (venueList as List).length);
        },
        initialPage: 0,
        header: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormFieldWithDottedBorder(context, txtController, "Search",onChanged: (p0) async {

            ref.read(venueSearchValueProvider.notifier).state = p0;
            controller.refresh();

          },),
        ),
        // filters: [
        //   TextTableFilter(chipFormatter: (name) => 'By $name', id: 'venue_name', title: "Venue Name"),
        //   DropdownTableFilter<dynamic>(
        //       id: "city",
        //       title: "City",
        //       chipFormatter: (city) => 'city ${city}',
        //       items: cityList.map((item) {
        //         return DropdownMenuItem(
        //           value: item,
        //           child: Text(
        //             item,
        //             style: const TextStyle(
        //                 color: CustomColor.txtMediumGray,
        //                 fontSize: 16,
        //                 fontWeight: FontWeight.normal),
        //           ),
        //         );
        //       }).toList()),
        // ],
        columns: [
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Name',
            cellBuilder: (p0) {
              return Text("${p0['venue_name']}");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Location',
            cellBuilder: (p0) {
              return Text("${p0['venue_location']}");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Email',
            cellBuilder: (p0) {
              return Text(p0['email'].toString().isNotEmpty ? "${p0['email']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Website',
            cellBuilder: (p0) {
              return Text(p0['website'].toString().isNotEmpty ? "${p0['website']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Country',
            cellBuilder: (p0) {
              return Text(p0['country']!=null ? "${p0['country']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'State',
            cellBuilder: (p0) {
              return Text(p0['state']!=null ? "${p0['state']}" : "-");
            },
          ),
          TableColumn(
            sortable: true,
            id: 'cityName',
            sizeFactor: sizeFactor,
            title: 'City',
            cellBuilder: (p0) {
              return Text(p0['city']!=null ? "${p0['city']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Status',
            cellBuilder: (p0) {
              return Text(p0['status']!=null ? "${p0['status']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: sizeFactor,
            title: 'Description',
            cellBuilder: (p0) {
              return Text(p0['venue_description']!=null ? "${p0['venue_description']}" : "-");
            },
          ),
          TableColumn(
            sizeFactor: 0.05,
            title: 'View Details',
            cellBuilder: (p0) => IconButton(
                onPressed: () {
                  print("vfnugh9t34 ${p0}");
                  var map = Map<String, dynamic>.from(p0);
                  // map['category'] = itemName;
                  // map['to'] = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
                  // context.goNamed(p0.containsKey('source') ? AppRoute.editMeditationArticle : AppRoute.editMeditationVideo,
                  //     queryParameters: map.map((key, value) => MapEntry(key.toString(), value.toString())));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VenueDetails(
                           VenueEntity.fromJson( Map<String, dynamic>.from(p0),)
                          )));
                },
                icon: Icon(Icons.edit_note_rounded)),
          ),
        ],

      );
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),),);
  }
}

class VenueDataSource extends DataGridSource {
  VenueDataSource({required List<VenueEntity> venueData}) {
    _employeeData = venueData
        .map<DataGridRow>((e) {
          return DataGridRow(
              cells: [
      DataGridCell<String>(columnName: 'Name', value: e.venueName),
      DataGridCell<String>(columnName: 'Location', value: e.venueLocation),
      DataGridCell<int>(columnName: 'Phone', value: e.phone),
      DataGridCell<String>(columnName: 'Email', value: e.email ?? '-'),
      DataGridCell<String>(columnName: 'Website', value: e.website ?? '-'),
      DataGridCell<String>(columnName: 'Country', value: e.country),
      DataGridCell<String>(columnName: 'State', value: e.state),
      DataGridCell<String>(columnName: 'City', value: e.city),
      DataGridCell<String>(columnName: 'Status', value: e.status),
      DataGridCell<String>(columnName: 'Venue Description', value: e.venueDescription ?? '-'),
      DataGridCell<String>(columnName: 'Detaails', value: "Details" ?? '-'),
    ]);
        }).toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(

        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(onTap: () {
            },child: Text(e.value.toString(),)),
          );
        }).toList());
  }
}
