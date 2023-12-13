import 'dart:async';
import 'dart:developer';

import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_details_screen.dart';
import 'package:book_my_turf_dashboard/routing/go_app_routes.dart';
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
import '../../../../shared/widget/shared_small_widgets.dart';
import '../controller/venue_controller.dart';

class VenueListScreen extends HookConsumerWidget {

  VenueListScreen({super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);
    var cities = ref.watch(getAllVenuesCityProvider);
    var sizeFactor = 0.1;

    var txtController = useTextEditingController();
    var cityController = useTextEditingController();
    var selectedCityList = useState([]);



    return cities.when(data: (cityList) {

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

          var venueList;

          if(ref.read(venueSearchValueProvider).isNotEmpty && ref.read(venueCitySearchValueProvider).isEmpty)
          {
            venueList = await Constants.supabase.from(SupaTables.venue_list).select().ilike('venue_name', "%${ref.read(venueSearchValueProvider)}%").range(pageToken, pageToken + pageSize);

            // venueList = await Constants.supabase
            //     .from(SupaTables.venue_list)
            //     .select()
            //     .or('venue_name.ilike."%${ref.read(venueSearchValueProvider)}%",city.ilike."%${ref.read(venueSearchValueProvider)}%"').range(pageToken, pageToken + pageSize);;
          }
          else if(ref.read(venueSearchValueProvider).isEmpty && ref.read(venueCitySearchValueProvider).isNotEmpty){
            venueList = await Constants.supabase.from(SupaTables.venue_list).select().ilike('city', "%${ref.read(venueCitySearchValueProvider)}%").range(pageToken, pageToken + pageSize);

          }
           else if(ref.read(venueCitySearchValueProvider).isNotEmpty && ref.read(venueSearchValueProvider).isNotEmpty)
           {
            venueList = await Constants.supabase
                .from(SupaTables.venue_list)
                .select().ilike('venue_name', "%${ref.read(venueSearchValueProvider)}%").eq('city', ref.read(venueCitySearchValueProvider));
           }
          else
          {
            venueList = await Constants.supabase.from(SupaTables.venue_list).select().range(pageToken, pageToken + pageSize);
          }
          return PaginationResult.items(elements: [...venueList as List], nextPageToken: (venueList).length < pageSize  ? null : pageToken + pageSize, size: (venueList as List).length);
        },
        initialPage: 0,
        header: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWithDottedBorder(context, cityController, ref.read(venueCitySearchValueProvider).isNotEmpty ? ref.read(venueCitySearchValueProvider) : "Search city",height: 35,onChanged: (p0) async {
                List list = await Constants.supabase.from(SupaTables.city).select().ilike('name', "%${p0}%").eq("country_id", 101).order('name',ascending: true);
                selectedCityList.value = _filterCities(list.map((e) => e['name'],).toList(), p0);
                if(p0.isEmpty){
                  selectedCityList.value.clear();
                  ref.read(venueCitySearchValueProvider.notifier).state = '';
                  ref.read(venueSearchValueProvider.notifier).state = '';
                  controller.refresh();
                }

              },),
            ),
            SizedBox(
              height: selectedCityList.value.isEmpty ? 0 : 100,
              child: ListView.builder(
                itemCount: selectedCityList.value.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return ListTile(contentPadding:EdgeInsets.zero,title: Text(selectedCityList.value[index]),onTap: () {
                      ref.read(venueCitySearchValueProvider.notifier).state = selectedCityList.value[index];
                      cityController.text = selectedCityList.value[index];
                      controller.refresh();
                    },);
                  },
                ),
            ),
              // SearchChoices.single(
            //   items: cityList.map((item) {
            //     return DropdownMenuItem(
            //       value: item,
            //       child: Text(
            //         item,
            //         style: const TextStyle(
            //             color: CustomColor.txtMediumGray,
            //             fontSize: 16,
            //             fontWeight: FontWeight.normal),
            //       ),
            //     );
            //   }).toList(),
            //   value: selectedValueSingleDialog.value,
            //   hint: "Select one",
            //   searchHint: "Select one",
            //   onChanged: (value) {
            //     selectedValueSingleDialog.value = value;
            //   },
            // ),
            // SearchableDropdown<dynamic>(
            //   hintText: const Text('Select city'),
            //   isEnabled: true,
            //   margin: const EdgeInsets.all(15),
            //   items: List.generate(cityList.length,  (index) {
            //       return SearchableDropdownMenuItem(
            //           value: cityList[index],
            //           label: cityList[index],
            //           child: Text(cityList[index]));
            //     }),
            //
            //   onChanged: (value) {
            //     debugPrint('$value');
            //   },
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 13.0,left: 8,right: 8,bottom: 8),
            //   child: TextFormFieldWithDottedBorder(context, cityController, "Search city",height: 35,onChanged: (p0) async {
            //
            //     ref.read(venueCitySearchValueProvider.notifier).state = p0;
            //     controller.refresh();
            //
            //   },),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormFieldWithDottedBorder(context, txtController, "Search venue name",height: 35,onChanged: (p0) async {
                ref.read(venueSearchValueProvider.notifier).state = p0;
                controller.refresh();
              },),
            )
          ],
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


                  print("VenueEntity.fromJson ${VenueEntity.fromJson( Map<String, dynamic>.from(p0),).toJson()}");
                  context.goNamed(AppRoute.venueDetailsScreen,pathParameters: {'id' : p0['id'].toString()});
                },
                icon: Icon(Icons.edit_note_rounded)),
          ),
        ],

      ) ;
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),),);
  }
  List<dynamic> _filterCities(List<dynamic> cities, query) {
    if (query.isEmpty) {
      return cities;
    } else {
      return cities.where((city) => city.toLowerCase().contains(query)).toList();
    }
  }
}

