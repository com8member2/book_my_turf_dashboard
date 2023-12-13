import 'package:book_my_turf_dashboard/consatant/Constants.dart';
import 'package:book_my_turf_dashboard/features/home/booking/presentation/booking_screen.dart';
import 'package:book_my_turf_dashboard/model/booking_entity.dart';
import 'package:book_my_turf_dashboard/shared/widget/custom_button.dart';
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
  BookingEntity? editItem;

  final id ;

   BookingDetailsScreen(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //print("staffList ${staffList}");





    var scrollController = useScrollController();


    return ref.watch(getBookingDetailsProvider(id)).when(data: (data) {
      editItem = data;
      var selectedItem = useState<String>(editItem?.status ?? BookingStatus.pending.value);
      var slotList = useState(editItem?.slots);
      var dateList = useState(editItem?.date);
      print(" editItem editItem editItem ${id} --- ${editItem}");

      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Booking Price : ${editItem?.price.toString()}"),
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: editItem?.userId !=null ? ref.watch(getAllBookingUsersProvider(editItem?.userId)).when(
                      data: (data) {
                        return Text("User Name : ${data[0]['name']}");
                      },
                      error: (error, stackTrace) => Text(error.toString()),
                      loading: () => SizedBox(),
                    ) : Text("User Name : ${editItem?.userName}"),
                  ),
                  ref.watch(getAllBookingVenueProvider(editItem?.venueId)).when(
                    data: (data) {
                      return Text("Venue Name : ${data[0]['venue_name']}");
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => SizedBox(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 25),
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking Dates : ",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      if(dateList.value!.isEmpty)
                        Center(child: Text("No dates found"),),
                      Flexible(
                        child:  SizedBox(
                            height: 50,
                            child: ListView.separated(
                              itemCount: dateList.value!.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = dateList.value?[index];
                                return SizedBox(
                                  width: 150,
                                  child: Card(
                                    child: ListTile(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      tileColor: CustomColor.gray.withOpacity(0.5),
                                      title: Text(item),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  width: 15,
                                );
                              },
                            )) ,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Booking Slots : ",
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        if(slotList.value!.isEmpty)
                          Center(child: Text("No slot found"),),
                        Flexible(
                          child:  SizedBox(
                              height: 200,
                              child: ListView.separated(
                                itemCount: slotList.value!.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final item = slotList.value?[index];
                                  print("slot list ${item?.turf}-----${[
                                    item?.turf
                                  ]}");
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.20,
                                    child: Card(
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                        tileColor: CustomColor.gray.withOpacity(0.5),
                                        subtitle: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("Price : ${item?.price}"),
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                      top: 10.0, bottom: 10),
                                                  child: Text(
                                                    "Time : ${item?.time}",
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Text("Duration : ${item?.duration}"),
                                              ]),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    width: 30,
                                  );
                                },
                              )) ,
                        ),
                      ],
                    ),
                  ),
                  ref.watch(getBookingTurfProvider(editItem?.turfId ??[])).when(
                    data: (turfList) {


                      return Padding(
                        padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Booking Turfs : ",
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            if(turfList.isEmpty)
                              Center(child: Text("No turfs found"),),
                            Expanded(
                              child: SizedBox(
                                height: 250,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: turfList.length,
                                  itemBuilder: (context, index) {
                                    final item = turfList[index];
                                    return SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.20,
                                        child: Card(
                                          child: ListTile(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                            tileColor: CustomColor.gray.withOpacity(0.5),
                                            title: Text("Name : ${item['turf_name'] != null ? item['turf_name'] : ""}",overflow: TextOverflow.ellipsis,),
                                            subtitle: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                  child: Text("Shape : ${item['turf_shape'] != null ? item['turf_shape'] : ""}",overflow: TextOverflow.ellipsis,),
                                                ),
                                                Text("Surface : ${item['ground_surface'] != null ? item['ground_surface'] : ""}",overflow: TextOverflow.ellipsis,),
                                                Padding(
                                                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                  child: Text("Facilities  : ${item['facilities'] != null ? item['facilities'].toString().replaceAll("[", '').replaceAll(']', '') : ""}",overflow: TextOverflow.ellipsis,),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                  separatorBuilder: (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 15,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    error: (error, stackTrace) => Text(error.toString()),
                    loading: () => SizedBox(),
                  ),


                ]),
          ),
          Positioned(child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton("Save", width: 200,() async {
                await Constants.supabase
                    .from(SupaTables.bookings)
                    .update({'status': selectedItem.value}).match(
                    {'id': editItem?.id}).then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookingScreen()));
                },);

              }),
            ),
          ))
        ],
      );
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),),);
  }
}
