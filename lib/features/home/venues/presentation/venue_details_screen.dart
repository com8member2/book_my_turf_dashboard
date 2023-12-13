import 'package:book_my_turf_dashboard/consatant/Constants.dart';
import 'package:book_my_turf_dashboard/features/home/venues/presentation/venue_list_screen.dart';
import 'package:book_my_turf_dashboard/shared/widget/shared_small_widgets.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../consatant/ColorConstant.dart';
import '../../../../model/venue_entity.dart';
import '../../../../shared/widget/custom_button.dart';
import '../../../../shared/widget/custom_image_view.dart';
import '../../../../utility/utility.dart';
import '../controller/venue_controller.dart';
import 'full_screen_image_preview.dart';



class VenueDetails extends HookConsumerWidget {
   VenueEntity? editItem;
  final id;

   VenueDetails(this.id);

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    //print("staffList ${staffList}");

    return ref.watch(getVenueDetailsProvider(id)).when(data: (data) {
      editItem = data;

      var selectedItem = useState<String>(editItem?.status ?? 'PENDING');

      var rejectMessageController = useTextEditingController();

      List<String> selectedImagesList = editItem?.images ?? [];
      List<VenueAmenities> amenityData = editItem?.amenities ?? [];
      var turfList = ref.watch(getTurfsProvider(editItem?.id));
      var staffList = ref.watch(getStaffProvider(editItem?.id));

      return Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25.0,bottom: 100,left: 25,right: 25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Venue Name : ${editItem?.venueName ?? "-"}"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Text("Venue Location : ${editItem?.venueLocation ?? "-"}"),
                  ),
                  Text("Venue Phone : ${editItem?.phone ?? "-"}"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Text("Email : ${editItem?.email ?? "-"}"),
                  ),
                  Text("Website : ${editItem?.website ?? "-"}"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Text("Country : ${editItem?.country ?? "-"}"),
                  ),
                  Text("State : ${editItem?.state ?? "-"}"),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,bottom: 20),
                    child: Text("city : ${editItem?.city ?? "-"}"),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text('Description : ${editItem?.venueDescription ?? "-"}'),
                  ),
                  Row(
                    children: [
                      Text("Change Status : "),
                      SizedBox(width: 20,),
                      SizedBox(width: 150,
                        child: DropdownButtonFormField(
                          decoration: dropDownDecoration('Status',context),
                          value: selectedItem.value ,
                          onChanged: (String? newValue) async {
                            if (newValue != null) {
                              selectedItem.value = newValue;
                              if(selectedItem.value == VenueStatus.rejected.value)
                              {
                                print("selectedItem.value ${selectedItem.value}");

                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      title: const Text("Send Reject Message",style: TextStyle(fontSize: 14),),
                                      content: Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: TextFormFieldWithDottedBorder(context,
                                            height: 35,
                                            rejectMessageController, "Send Reject Message"),
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel')),
                                        TextButton(
                                          onPressed: () async {
                                            await Constants.supabase.rpc('send_push_notification', params: {
                                              'receiver_user_id': '9bfa42e2-e811-4a1b-9efe-ee0982f0922c',
                                              'title': 'Reject Notification',
                                              'message': 'Your venue has been rejected please check your venue details again'
                                            });
                                            //await Constants.supabase.from(SupaTables.venue_list).update({'status' : selectedItem.value}).match({'id' : editItem.id});
                                            print("rejectMessageController ${rejectMessageController.text}");
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Send"),
                                        )
                                      ]),
                                );
                              }

                            }
                          },
                          items: [VenueStatus.rejected.value, VenueStatus.approved.value, VenueStatus.inActive.value,VenueStatus.pending.value].map<DropdownMenuItem<String>>((String value) {return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value,style: TextStyle(fontSize: 16),),
                          );}).toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Amenities : "),
                        SizedBox(width: 40,),
                        Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          children: List.generate(
                            amenityData.length,
                                (index) {
                              return FilterChip(
                                showCheckmark: false,
                                label: Text(amenityData[index].name ?? "-",
                                    style: TextStyle(color: CustomColor.primaryGreen)),
                                selected: false,
                                onSelected: (bool selected) {

                                },
                                selectedColor: CustomColor.primaryGreen,
                                backgroundColor: Colors.transparent,
                                checkmarkColor: CustomColor.white,

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: const BorderSide(color: CustomColor.primaryGreen),
                                ),
                              );
                              //
                              // CustomChipWidget(
                              //     amenityData[index]['name'],
                              //     selectedItemValue.value != amenityData[index]['name'],
                              //         (value) {
                              //       selectedItemValue.value =
                              //       amenityData[index]['name'];
                              //       //selectedItemList.value.add(amenityData[index]['name']);
                              //       print(
                              //           "selected item ${selectedItemValue.value}");
                              //     })
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Venue Images : ",
                      ),
                      SizedBox(width: 20,),
                      SizedBox(
                          height: 200,
                          child: ListView.separated(
                            itemCount: selectedImagesList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return DottedBorder(
                                color: CustomColor.primaryGreen,
                                dashPattern: const [3, 3, 3, 3],
                                strokeWidth: 1,
                                radius: const Radius.circular(10),
                                borderType: BorderType.RRect,
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation, secondaryAnimation) {
                                            return FullScreenImagePreview(selectedImagesList,index);
                                          },
                                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                            const begin = Offset(0.0, 1.0);
                                            const end = Offset.zero;
                                            const curve = Curves.easeInOut;
                                            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                            var offsetAnimation = animation.drive(tween);
                                            return SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: CustomImageView(
                                      useCache: false,
                                      height: 200,
                                      width: 200,
                                      radius: BorderRadius.circular(10),
                                      alignment: Alignment.bottomCenter,
                                      imagePath: "assets/images/profile_placeholder.jpg",
                                      url: selectedImagesList[index],),
                                  ),
                                ),
                              );
                            }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 30,); },)
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,bottom: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Venue Turfs : '),
                        SizedBox(width: 25,),
                        turfList.when(
                          data: (turfData) {
                            print("turfData ${turfData}");
                            if (turfData.isEmpty) return Center(child: Text("No Turf Found"));
                            return SizedBox(
                              height: 250,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: turfData.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.13,
                                      child: Card(
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          tileColor: CustomColor.gray.withOpacity(0.5),
                                          title: Text("Name : ${turfData[index]['turf_name'] != null ? turfData[index]['turf_name'] : ""}",overflow: TextOverflow.ellipsis,),
                                          subtitle: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                child: Text("Shape : ${turfData[index]['turf_shape'] != null ? turfData[index]['turf_shape'] : ""}",overflow: TextOverflow.ellipsis,),
                                              ),
                                              Text("Surface : ${turfData[index]['ground_surface'] != null ? turfData[index]['ground_surface'] : ""}",overflow: TextOverflow.ellipsis,),
                                              Padding(
                                                padding: const EdgeInsets.only(top: 10,bottom: 10),
                                                child: Text("Facilities  : ${turfData[index]['facilities'] != null ? turfData[index]['facilities'].toString().replaceAll("[", '').replaceAll(']', '') : ""}",overflow: TextOverflow.ellipsis,),
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
                            );
                          },
                          error: (error, stackTrace) => Text(error.toString()),
                          loading: () => Center(
                            child: Container(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Staff Details : "),
                      SizedBox(width: 20,),
                      staffList.when(data: (staffData) {
                        if(staffData.isEmpty) return Text("No staff found");
                        return  SizedBox(
                            height: 200,
                            child: ListView.separated(
                              itemCount: staffData.length,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final item = staffData[index];
                                return SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.13,
                                    child: Card(
                                        child: ListTile(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                          tileColor: CustomColor.gray.withOpacity(0.5),
                                          title: Text("${item['owner_profile']['name']}"),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(top: 15.0),
                                            child: Text("${item['role']['role_name'] ?? ""}",style: TextStyle(color: CustomColor.txtMediumGray),),
                                          ),
                                        )
                                    ));
                              }, separatorBuilder: (BuildContext context, int index) { return SizedBox(width: 30,); },)
                        );
                      }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),),)

                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton("Save", width: 200,() async {
                await Constants.supabase.from(SupaTables.venue_list).update({'status' : selectedItem.value}).match({'id' : editItem?.id}).then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VenueListScreen()));
                },);
              }),
            ),
          ))
        ],
      );
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(child: CircularProgressIndicator(),));
  }
}
