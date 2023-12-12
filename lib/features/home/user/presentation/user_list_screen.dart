import 'package:book_my_turf_dashboard/features/home/user/controller/user_controller.dart';
import 'package:book_my_turf_dashboard/routing/app_routes.dart';
import 'package:book_my_turf_dashboard/utility/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:paged_datatable/paged_datatable.dart';
import '../../../../consatant/Constants.dart';
import '../../../../shared/widget/shared_small_widgets.dart';
import '../../home_screen.dart';

class UserListScreen extends HookConsumerWidget {
   UserListScreen({super.key});

  final controller = PagedDataTableController<int, Map<dynamic, dynamic>>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var defaultText = TextStyle(color: Theme.of(context).colorScheme.onBackground);

    var sizeFactor = 0.14;

    var txtController = useTextEditingController();
    
    return PagedDataTable<int, Map>(
      // filters: [TextTableFilter(chipFormatter: (value) => 'By $value', id: 'name', title: 'Trainer\'s Name')],TODO pending
      controller: controller,
      theme: PagedDataTableThemeData(
          configuration: const PagedDataTableConfiguration(initialPageSize: 10,pageSizes: [10,20,50,100],),
          footerTextStyle: Theme.of(context).textTheme.bodyMedium,
          headerTextStyle: Theme.of(context).textTheme.titleLarge,
          rowsTextStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText,
          dividerColor: Theme.of(context).secondaryHeaderColor,
          border: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12), side: BorderSide(color: Theme.of(context).primaryColor)),
          backgroundColor: Theme.of(context).colorScheme.background,
          textStyle: Theme.of(context).textTheme.bodyMedium ?? defaultText
      ),
      fetchPage: (pageToken, pageSize, sortBy, filtering) async {

        //print("has number ${hasNumber(filtering.valueOrNull('name'))} ----- ${hasOnlyLetters(filtering.valueOrNull('name'))}");
        print("----------- ${ref.read(userSearchValueProvider)}");
        var users ;
        if (ref.read(userSearchValueProvider).isNotEmpty) {
          print("in ifff ${users}");
          if (hasNumber(ref.read(userSearchValueProvider))) // execute when enter phone-number
          {
            users = await Constants.supabase
                .from(SupaTables.user_profile)
                .select()
                .ilike('phone', "%${ref.read(userSearchValueProvider)}%")
                .range(pageToken, pageToken + pageSize);
          }
          else // execute when enter username
          {
            users = await Constants.supabase
                .from(SupaTables.user_profile)
                .select()
                .ilike('name', "%${ref.read(userSearchValueProvider)}%")
                .range(pageToken, pageToken + pageSize);
          }
        }


        else
        {
          print("in else ${users}");
          users = await Constants.supabase.from(SupaTables.user_profile).select().range(pageToken, pageToken + pageSize);
        }

        print("users ${users}");

        return PaginationResult.items(elements: [...users], nextPageToken: (users).length < pageSize  ? null : pageToken + pageSize, size: (users as List).length);
      },
      initialPage: 0,
      header: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormFieldWithDottedBorder(context, txtController, "Search",onChanged: (p0) async {

          ref.read(userSearchValueProvider.notifier).state = p0;
          controller.refresh();

        },),
      ),
      columns: [

        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Name',
          cellBuilder: (p0) {
            return Text("${p0['name']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'Email',
          cellBuilder: (p0) {
            return Text("${p0['email']}");
          },
        ),
        TableColumn(
          sizeFactor:sizeFactor,
          title: 'Phone',
          cellBuilder: (p0) {
            return Text("${p0['phone']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'DateOfBirth',
          cellBuilder: (p0) {
            return Text("${p0['dateOfBirth']}");
          },
        ),
        TableColumn(
          sizeFactor: 0.04,
          title: 'Gender',
          cellBuilder: (p0) {
            return Text("${p0['gender']}");
          },
        ),
        TableColumn(
          sizeFactor: sizeFactor,
          title: 'City',
          cellBuilder: (p0) {
            return Text(p0['city'] !=null ? "${p0['city']}" : "-");
          },
        ),
        TableColumn(

          sizeFactor: 0.06,
          title: 'Block',
          cellBuilder: (p0) => TextButton(onPressed: () async {

            if(p0['isBlock']==true){
              await Constants.supabase.from(SupaTables.user_profile).update({"isBlock" : false}).match({"id" : p0['id']}).then((value) {
                controller.refresh();
              },);
            }
            else{
              await Constants.supabase.from(SupaTables.user_profile).update({"isBlock" : true}).match({"id" : p0['id']}).then((value) {
                controller.refresh();
              },);
            }

          }, child: Text(p0['isBlock']==true ? "UNBLOCK" : "BLOCK",style: TextStyle(fontSize: 12),)),
        ),
        // TableColumn(
        //   sizeFactor: 0.09,
        //   title: 'Name',
        //   cellBuilder: (p0) => Text("${p0['first_name'].toString()} ${p0['last_name'].toString()}"),
        // ),
        // TableColumn(
        //   sizeFactor: 0.09,
        //   title: 'Date of birth',
        //   cellBuilder: (p0) => Text("${p0['date_of_birth'].toString()} "),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //   title: 'Phone  Number ',
        //   cellBuilder: (p0) => Text("${p0['phone'].toString()} "),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //   id: 'email',
        //   title: 'Email',
        //   cellBuilder: (p0) => Text(p0['email'].toString()),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //   title: 'Sex',
        //   cellBuilder: (p0) => Text("${p0['gender'].toString()} "),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //
        //   title: 'Country',
        //   cellBuilder: (p0) => Text("${p0['country'].toString()} "),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //   title: 'City',
        //   cellBuilder: (p0) => Text(p0['city'].toString().isNotEmpty ? "${p0['city'].toString()}" : "  -  "),
        // ),
        // TableColumn(sizeFactor: 0.09,
        //
        //   title: 'Agent code',
        //   cellBuilder: (p0) => Text(p0['agent_code'] != null ? "${p0['agent_code'].toString()}" : "-"),
        // ),
        // TableColumn(
        //   sizeFactor: 0.09,
        //
        //   title: 'ORG code',
        //   cellBuilder: (p0) => Text(p0['organization_code'] != null ? "${p0['organization_code'].toString()}" : "-"),
        // ),
        // TableColumn(
        //   sizeFactor: 0.09,
        //
        //   title: 'Points',
        //   cellBuilder: (p0) => Text("${p0['points'].toString()} "),
        // ),
        // LargeTextTableColumn(
        //   decoration: InputDecoration(enabled: false),
        //   sizeFactor: 0.15,
        //   title: 'Description',
        //   getter: (Map<dynamic, dynamic> item) {
        //     return item['description'];
        //   },
        //   setter: (Map<dynamic, dynamic> item, String newValue, int rowIndex) {
        //     return false;
        //   },
        // ),

        // DropdownTableColumn<Map<dynamic, dynamic>, String>(
        //   title: 'Workout Level',
        //   items: Constants.workoutLevels
        //       .map((e) => DropdownMenuItem<String>(
        //     child: Text(e),
        //     value: e,
        //   ))
        //       .toList(),
        //   getter: (Map<dynamic, dynamic> item) {
        //     return item['workout_level'].toString();
        //   },
        //   setter: (Map<dynamic, dynamic> item, Object? newValue, int rowIndex) {
        //     return true;
        //   },
        // ),
        // TableColumn(
        //   title: 'Views',
        //   cellBuilder: (p0) => Text(p0['view_count'].toString()),
        // ),
        // TableColumn(
        //   title: 'KCal',
        //   cellBuilder: (p0) => Text(p0['Kcal'].toString()),
        // ),
        // TableColumn(
        //   title: 'Thumbnail',
        //   cellBuilder: (p0) => IconButton(
        //       onPressed: () {
        //         launchUrlString(p0['image']);
        //       },
        //       icon: Icon(Icons.image)),
        // ),
        // TableColumn(
        //   title: 'Video link',
        //   cellBuilder: (p0) => IconButton(onPressed: () {}, icon: Icon(Icons.video_file)),
        // ),
        // TableColumn(
        //   sizeFactor: 0.05,
        //   title: 'Edit',
        //   cellBuilder: (p0) => IconButton(onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => AddWorkoutVideo(editItem: Map<String, dynamic>.from(p0),)));
        //
        //
        //   }, icon: Icon(Icons.edit_note_rounded)),
        // ),
        // TableColumn(
        //   sizeFactor: 0.05,
        //   title: 'Delete',
        //   cellBuilder: (p0) => IconButton(
        //       onPressed: () {
        //         showConfirmationDialog(
        //           context,
        //           'Are you sure you want to delete?',
        //               () {
        //             Constants.supabase.from(SupaTables.workout_videos).delete().eq('id', p0['id']).then((value) {
        //               controller.removeRow(p0);
        //             }).onError((error, stackTrace) {
        //               log(error.toString());
        //               return null;
        //             });
        //           },
        //         );
        //       },
        //       icon: Icon(Icons.delete)),
        // ),
      ],

    );
  }
}
